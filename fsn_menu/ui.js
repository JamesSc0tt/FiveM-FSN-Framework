/*--------------------------------------------------------------------------

    ActionMenu 
    Created by WolfKnight
    Additional help from lowheartrate, TheStonedTurtle, and Briglair.  

--------------------------------------------------------------------------*/
var atstorage = false
$( function() {
    // Adds all of the correct button actions 
    //init();

    // Gets the actionmenu div container 
    var actionContainer = $( "#actionmenu" );

    // Listens for NUI messages from Lua 
    window.addEventListener( 'message', function( event ) {
        var item = event.data;
        // Show the menu 
        if ( item.showmenu ) {
            ResetMenu()
            actionContainer.show();
			if (item.atstorage) {
				atstorage = true
			} else {
				atstorage = false
			}
			if (item.vehicle) {
				$('#vehiclebutton').show()
			} else {
				$('#vehiclebutton').hide()
			}
			if (item.police) {
				$('#policebutton').show()
				if (item.pdcommand) {
					$('#pdcommandbutton').show()					
				} else {
					$('#pdcommandbutton').hide()
				}
			} else {
				$('#policebutton').hide()
				$('#pdcommandbutton').hide()
			}
			if (item.ems) {
				$('#emsbutton').show()
				if (item.emscommand) {
					$('#emscommandbutton').show()					
				} else {
					$('#emscommandbutton').hide()
				}
			} else {
				$('#emsbutton').hide()
				$('#emscommandbutton').hide()
			}
			
			if (item.dead) {
				$('#phonebutton').hide()
				$('#licensebutton').hide()
				$('#inventorybutton').hide()
				$('#vehiclebutton').hide()
				$('#policebutton').hide()
				$('#pdcommandbutton').hide()
				$('#emsbutton').hide()
				$('#emscommandbutton').hide()
			} else {
				$('#phonebutton').show()
				$('#licensebutton').show()
				$('#inventorybutton').show()
			}
        }
		
        // Hide the menu 
        if ( item.hidemenu ) {
            actionContainer.hide(); 
        }
		init()
    } );
} )

// Hides all div elements that contain a data-parent, in
// other words, hide all buttons in submenus. 
function ResetMenu() {
    $( "div" ).each( function( i, obj ) {
        var element = $( this );

        if ( element.attr( "data-parent" ) ) {
            element.hide();
        } else {
            element.show();
        }
    } );
}

// Configures every button click to use its data-action, or data-sub
// to open a submenu. 
function init() {
    // Loops through every button that has the class of "menuoption"
    $( ".menuoption" ).each( function( i, obj ) {
		
        // If the button has a data-action, then we set it up so when it is 
        // pressed, we send the data to the lua side. 
        if ( $( this ).attr( "data-action" ) ) {
            $( this ).click( function() { 
                var data = $( this ).data( "action" ); 

                sendData( "ButtonClick", data ); 
            } )
        }

        // If the button has a data-sub, then we set it up so when it is 
        // pressed, we show the submenu buttons, and hide all of the others.
        if ( $( this ).attr( "data-sub" ) ) {
            $( this ).click( function() {
                var menu = $( this ).data( "sub" );
                var element = $( "#" + menu ); 
                element.show();
                $( this ).parent().hide();  
            } )
        }
    } );
}

// Send data to lua for processing.
function sendData( name, data ) {
    $.post( "http://fsn_menu/" + name, JSON.stringify( data ), function( datab ) {
        if ( datab != "ok" ) {
            console.log( datab );
        }            
    } );
}

// Close menu on ESCAPE key pressed
document.onkeyup = function (data) {
	if (data.which == 27) { // Escape key
		$.post('http://fsn_menu/escape', JSON.stringify({}));
	}
};