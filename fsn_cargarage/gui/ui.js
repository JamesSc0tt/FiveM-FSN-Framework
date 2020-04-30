/*--------------------------------------------------------------------------

    ActionMenu 
    Created by WolfKnight
    Additional help from lowheartrate, TheStonedTurtle, and Briglair.  

--------------------------------------------------------------------------*/
function displayCash(cash) {
	if (Number.isInteger(cash)) {
		return '$'+cash
	} else {
		return cash
	}
}

$( function() {
    // Adds all of the correct button actions 
    init();

    // Gets the actionmenu div container 
    var actionContainer = $( "#ass" );

    // Listens for NUI messages from Lua 
    window.addEventListener( 'message', function( event ) {
        var item = event.data;
		
        if (item.receive == 'vehicles') {
			if (item.garage != '[]') {
				var grg = JSON.parse(item.garage)
				$('.section').html('')
				var shit = document.querySelectorAll('[data-spawn="garage"]')
				for (var i = 0; i < shit.length; i++) {
				  var item = shit[i]; 
				  item.remove();
				}
				$('.exit').remove()
				
				jQuery.each(grg, function(i, val) {
					if (val.veh_status == 0) {
						var color = 'green'
						var stat = 'IN'
						var price = 50
					} else if (val.veh_status == 1) {
						var color = 'orange'
						var stat = 'OUT'
						var price = 'UNAVAILABLE'
					} else if(val.veh_status == 2) {
						var color = 'red'
						var stat = 'IMPOUNDED'
						var price = 2500
					} else if (val.veh_status == 3) {
						var color = 'black'
						var stat = 'REPO/SEIZE'
						var price = 'UNAVAILABLE'
					}
					$('.section').append('<button class="menuoption '+color+'" data-sub="'+val.veh_id+'">['+stat+'] '+val.veh_displayname+'</button>')
					$('#actionmenu').append('<div id="'+val.veh_id+'" data-spawn="garage" data-parent="mainmenu" style="display: none;"><button class="menuoption" data-action="spawn-'+val.veh_id+'">SPAWN (<b>'+displayCash(price)+'</b>)</button><button class="menuoption" data-action="sell-'+val.veh_id+'">SELL</button></div>')
				});
				$('#actionmenu').append('<button class="menuoption exit" data-action="exit">Exit</button>')
				init()
			}
        }
        if (item.receive == 'boats') {
            if (item.garage != '[]') {
                var grg = JSON.parse(item.garage)
                $('.section').html('')
                var shit = document.querySelectorAll('[data-spawn="garage"]')
                for (var i = 0; i < shit.length; i++) {
                  var item = shit[i]; 
                  item.remove();
                }
                $('.exit').remove()
                
                jQuery.each(grg, function(i, val) {
                    if (val.veh_status == 0) {
                        var color = 'green'
                        var stat = 'IN'
                        var price = 50
                    } else if (val.veh_status == 1) {
                        var color = 'orange'
                        var stat = 'OUT'
                        var price = 'UNAVAILABLE'
                    } else if(val.veh_status == 2) {
                        var color = 'red'
                        var stat = 'IMPOUNDED'
                        var price = 2500
                    } else if (val.veh_status == 3) {
                        var color = 'black'
                        var stat = 'REPO/SEIZE'
                        var price = 'UNAVAILABLE'
                    }
                    $('.section').append('<button class="menuoption '+color+'" data-sub="'+val.veh_id+'">['+stat+'] '+val.veh_displayname+'</button>')
                    $('#actionmenu').append('<div id="'+val.veh_id+'" data-spawn="garage" data-parent="mainmenu" style="display: none;"><button class="menuoption" data-action="spawn-'+val.veh_id+'">SPAWN (<b>'+displayCash(price)+'</b>)</button><button class="menuoption" data-action="sell-'+val.veh_id+'">SELL</button></div>')
                });
                $('#actionmenu').append('<button class="menuoption exit" data-action="exit">Exit</button>')
                init()
            }
        }
        if (item.receive == 'aircrafts') {
            if (item.garage != '[]') {
                var grg = JSON.parse(item.garage)
                $('.section').html('')
                var shit = document.querySelectorAll('[data-spawn="garage"]')
                for (var i = 0; i < shit.length; i++) {
                  var item = shit[i]; 
                  item.remove();
                }
                $('.exit').remove()
                
                jQuery.each(grg, function(i, val) {
                    if (val.veh_status == 0) {
                        var color = 'green'
                        var stat = 'IN'
                        var price = 50
                    } else if (val.veh_status == 1) {
                        var color = 'orange'
                        var stat = 'OUT'
                        var price = 'UNAVAILABLE'
                    } else if(val.veh_status == 2) {
                        var color = 'red'
                        var stat = 'IMPOUNDED'
                        var price = 2500
                    } else if (val.veh_status == 3) {
                        var color = 'black'
                        var stat = 'REPO/SEIZE'
                        var price = 'UNAVAILABLE'
                    }
                    $('.section').append('<button class="menuoption '+color+'" data-sub="'+val.veh_id+'">['+stat+'] '+val.veh_displayname+'</button>')
                    $('#actionmenu').append('<div id="'+val.veh_id+'" data-spawn="garage" data-parent="mainmenu" style="display: none;"><button class="menuoption" data-action="spawn-'+val.veh_id+'">SPAWN (<b>'+displayCash(price)+'</b>)</button><button class="menuoption" data-action="sell-'+val.veh_id+'">SELL</button></div>')
                });
                $('#actionmenu').append('<button class="menuoption exit" data-action="exit">Exit</button>')
                init()
            }
        }

        // Show the menu 
        if ( item.showmenu ) {
            ResetMenu()
            actionContainer.show();
        }

        // Hide the menu 
        if ( item.hidemenu ) {
            actionContainer.hide(); 
        }
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
    $.post( "http://fsn_cargarage/" + name, JSON.stringify( data ), function( datab ) {
        if ( datab != "ok" ) {
            console.log( datab );
        }            
    } );
}