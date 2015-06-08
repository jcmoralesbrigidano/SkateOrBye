// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: '/spots',
		success: function(response) { initialize(response); }
	});

	function initialize(response) {
		var mapContainer = document.getElementById('map-container');
		var spots = [];

		for(var i = 0; i < response.length; i++) {
			spots.push(response[i]);				
		}

		var map;
	  	var mapOptions = {
	    	zoom: 11,
	    	mapTypeId: google.maps.MapTypeId.ROAD,
	    	styles: [
	    		{
			        "featureType": "all",
			        "elementType": "all",
			        "stylers": [
			            {
			                "invert_lightness": true
			            },
			            {
			                "saturation": 10
			            },
			            {
			                "lightness": 30
			            },
			            {
			                "gamma": 0.5
			            },
			            {
			                "hue": "#435158"
			            }
			        ]
		    	}
			]
	  	};

	  	var positions = [];
		
	  	for(var i = 0; i < spots.length; i++) {
	  		positions.push(spots[i]);
	  	}

	  	map = new google.maps.Map(mapContainer, mapOptions);

	  	if(navigator.geolocation) {
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	for(var i = 0; i < positions.length; i++) {
		    		var pos = new google.maps.LatLng(positions[i].latitude, positions[i].longitude);

		    		var marker = new google.maps.Marker({
		    			map: map,		    			
		    			position:pos,
		    			icon: '<%= asset_url('skateboard.png') %>',
		    			title: (i + 1).toString()
		    		});

		    		addClickEventForEachMarker(marker);
		    	}

		    	var yourPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

		    	var yourPositionMarker = new google.maps.Marker({
		    			map: map,
		    			position: yourPosition,
		    			draggable: true,
		    			icon: '<%= asset_url('bartSkater.gif') %>',
		    			title: 'You are here!'
		    	});

		    	google.maps.event.addDomListener(yourPositionMarker, 'dragend', function() {
		    		var latitude = yourPositionMarker.getPosition().lat();
		    		var longitude = yourPositionMarker.getPosition().lng();;

			    	var infoWindowYourPositionContent = '<a class="add-spot-button" href=/spots/new?latitude=' + latitude + '&longitude=' + longitude + '>Add spot here</a>';

			    	var infoWindowYourPosition = new google.maps.InfoWindow({
			    		content: infoWindowYourPositionContent
			    	});

		    		infoWindowYourPosition.open(map, yourPositionMarker);
		    	});

		    	function addClickEventForEachMarker(marker) {
		    		google.maps.event.addDomListener(marker, 'click', function() {
						var spotId = marker.getTitle();

						var infoWindowSpotsContent = '<a href=/spots/' + spotId + '>Go to this spot</a>';

				    	var infoWindowSpots = new google.maps.InfoWindow({
				    		content: infoWindowSpotsContent
				    	});

				    	infoWindowSpots.open(map, marker);
					});
		    	}		    	
				
				map.setCenter(yourPosition);
		    }, function() {
		    	handleNoGeolocation(true);
		    });
	    } else {
	    	handleNoGeolocation(false);
	  	}
	}

	function handleNoGeolocation(errorFlag) {
	    if (errorFlag) {
	    	var content = 'Error: The Geolocation service failed.';
	    } else {
	    	var content = 'Error: Your browser does not support geolocation.';
	    }
	}
});