$( function() {
    init();
    var actionContainer = $( "#actionmenu" );
    window.addEventListener( 'message', function( event ) {
        var item = event.data;
        if ( item.showmenu ) {
			ResetMenu()
			// draw the menus
			if (item.forSale) {
				$('#property-info').html('')
				$('#property-info').append('<button class="menuoption" data-action="info-buy">Purchase ($50,000)</button>')
			} else {
				$('#property-info').html('')
				if (item.isOwner) {
					$('#property-info').append('<button class="menuoption" data-action="info-show">Property Info</button>'+
					'<button class="menuoption" data-action="info-rent">Pay Rent</button>'+
					'<button class="menuoption" data-sub="property-keys">Edit Access</button>')
					$('#property-keys').html('')
					$('#property-keys').append('<button class="menuoption" data-action="keys-grant"><b>ADD CHARID</b></button>')
					if (item.keys) {
						var keys = JSON.parse(item.keys)
						jQuery.each(keys, function(i, val) {
							if (val != null) {
								$('#property-keys').append('<button class="menuoption" data-action="keys-remove-'+val.id+'">'+val.name+' ('+val.id+')</button>')
							}
						})
					}
				}
				if (item.hasKeys) {
					// inventory
					$('#property-info').append('<button class="menuoption" data-action="inventory">Inventory</button>')
					
					// weapons
					$('#property-weapons').html('')
					$('#property-info').append('<button class="menuoption" data-sub="property-weapons">Weapons</button>')
					$('#property-weapons').append('<button class="menuoption" data-action="weapon-deposit"><b>DEPOSIT WEAPON</b></button>')
					if (item.weapons) {
						var weps = JSON.parse(item.weapons)
						jQuery.each(weps, function(i, val) {
							if (val != null) {
								$('#property-weapons').append('<button class="menuoption" data-action="weapon-take-'+i+'">'+val.name+' ('+val.owner.serial+')</button>')
							}
						})
					}
					
					//money
					$('#property-info').append('<button class="menuoption" data-sub="property-money">Money</button>')
					$('#property-money').html('')
					$('#property-money').append('<button class="menuoption" style="background-color:rgba(255,255,255,0.0);color:green;font-size:20px;border:none;"><b>$'+item.money.toLocaleString()+'</b></button>'+
						'<button class="menuoption" data-action="money-withdraw">Withdraw Cash</button>'+
						'<button class="menuoption" data-action="money-deposit">Deposit Cash</button>')
				} else {
					$('#property-info').append('<button class="menuoption" data-action="info-show">Property Info</button>'+
						'<button class="menuoption" data-action="robbery">Rob Property</button>')
				}
				if (item.DOJ || item.POLICE) {
					$('#property-info').append('<button class="menuoption" data-sub="property-police" style="background-color:#b6d0f9">C/HC Options</button>')
					$('#property-police').html('')
					$('#property-police').append('<button class="menuoption" data-action="police-search-'+item.property_id+'" style="background-color:#b6d0f9">Search</button>'+
						'<button class="menuoption" data-action="police-seize-'+item.property_id+'" style="background-color:#b6d0f9">Seize Property</button>'+
						'<button class="menuoption" data-action="police-empty-'+item.property_id+'" style="background-color:#b6d0f9">Empty Property</button>'+
						'<button class="menuoption" data-action="police-breach-'+item.property_id+'" style="background-color:#b6d0f9">Breach Property</button>')
				}
			}
            actionContainer.show();
			
			
			/* 
			if (item.updateProperty) {
				if (item.owned) {
					$('#property-info').html('')
					if (item.robbery) {
						$('#property-info').append('<button class="menuoption" data-action="rent-check-'+item.property_id+'">Property Info</button>'+
						'<button class="menuoption" data-action="robbery-'+item.property_id+'">Rob Property</button>')	
					}
					if (item.propertyOwner) {
						// Access menu 
						$('#property-info').append('<button class="menuoption" data-sub="property-accessmenu">Access</button>')
						$('#property-accessmenu').html('')
						$('#property-accessmenu').append('<button class="menuoption" data-action="access-allow-'+item.property_id+'">Allow Access</button>'+
							'<button class="menuoption" data-action="access-view-'+item.property_id+'">View Access</button>'+
							'<button class="menuoption" data-action="access-revoke-'+item.property_id+'">Revoke Access</button>')
						$('#property-info').append('<button class="menuoption" data-sub="property-rentmenu">Rent Options</button>')
						$('#property-rentmenu').html('')
						$('#property-rentmenu').append('<button class="menuoption" data-action="rent-check-'+item.property_id+'">Check Rent</button>'+
							'<button class="menuoption" data-action="rent-pay-'+item.property_id+'">Pay Rent</button>')
					}
					if (item.propertyAccess) {
						// Inventory menu
						$('#property-info').append('<button class="menuoption" data-sub="property-inventory">Inventory</button>')
						$('#property-inventory').html('')
						$('#property-inventory').append('<button class="menuoption" data-action="item-deposit-'+item.property_id+'"><b>Deposit Item</b></button>')
						inv = JSON.parse(item.inventory)
						jQuery.each(inv, function(i, val) {
							if (i == 'dirty_money') {
								$('#property-inventory').append('<button class="menuoption" data-action="item-take-'+i+'-'+item.property_id+'">'+val.item_name+' ($'+val.amount+')</button>')
							} else {
								$('#property-inventory').append('<button class="menuoption" data-action="item-take-'+i+'-'+item.property_id+'">['+val.amount+'X] '+val.item_name+'</button>')
							}
						});
						
						// Weapons menu
						//$('#property-info').append('<button class="menuoption" data-sub="property-weapons">Weapons</button>')
						//$('#property-weapons').html('')
						//$('#property-weapons').append('<button class="menuoption" data-action="weapon-deposit-'+item.property_id+'"><b>Deposit Weapon</b></button>')
						//inv = JSON.parse(item.weapons)
						//jQuery.each(inv, function(i, val) {
						//	$('#property-weapons').append('<button class="menuoption" data-action="weapon-take-'+i+'-'+item.property_id+'">['+val.amount+'X] '+i+'</button>')
						//});
						
						// Money menu
						$('#property-info').append('<button class="menuoption" data-sub="property-money">Money</button>')
						$('#property-money').html('')
						$('#property-money').append('<button class="menuoption" style="background-color:rgba(255,255,255,0.0);color:green;font-size:20px;border:none;"><b>$'+item.money+'</b></button>'+
							'<button class="menuoption" data-action="money-withdraw-'+item.property_id+'">Withdraw Cash</button>'+
							'<button class="menuoption" data-action="money-deposit-'+item.property_id+'">Deposit Cash</button>')
					}
					if (item.policeHC) {
						// Police menu
						$('#property-info').append('<button class="menuoption" data-sub="property-police" style="background-color:#b6d0f9">C/HC Options</button>')
						$('#property-police').html('')
						$('#property-police').append('<button class="menuoption" data-action="police-search-'+item.property_id+'" style="background-color:#b6d0f9">Search</button>'+
							'<button class="menuoption" data-action="police-seize-'+item.property_id+'" style="background-color:#b6d0f9">Seize Property</button>'+
							'<button class="menuoption" data-action="police-empty-'+item.property_id+'" style="background-color:#b6d0f9">Empty Property</button>'+
							'<button class="menuoption" data-action="police-breach-'+item.property_id+'" style="background-color:#b6d0f9">Breach Property</button>')
					}
					$('#property-info').show()
					init()
				} else {
					$('#property-info').html('')
					$('#property-info').append('<button class="menuoption" data-action="buy-'+item.property_id+'">Buy Property ($'+item.price+')</button>')
					$('#property-info').show()
					init()
				}
			}
			*/
        }
        if ( item.hidemenu ) {
            actionContainer.hide(); 
        }
		init()
    } );
} )

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

function init() {
    $( ".menuoption" ).each( function( i, obj ) {
        if ( $( this ).attr( "data-action" ) ) {
            $( this ).click( function() { 
                var data = $( this ).data( "action" ); 

                sendData( "ButtonClick", data ); 
            } )
        }
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

function sendData( name, data ) {
    $.post( "http://fsn_properties/" + name, JSON.stringify( data ), function( datab ) {
        if ( datab != "ok" ) {
            console.log( datab );
        }            
    } );
}