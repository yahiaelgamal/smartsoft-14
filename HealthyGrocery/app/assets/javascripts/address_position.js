// Author: Karim El-Bawab
// Team: 4
// Script name: address_position
// Function: This script is used to show a map while the user
// add an address to give him the ability to locate his 
// address accurately using an animated marker.



// Author: Karim El-Bawab
// Team: 4
// Function: This is block of code below used to get the values 
// of the latitude and the longitude passed through the url 

var latitude = gon.lat;
var longitude = gon.lng;
var url = window.location.href;
var urlsplit = url.split("?");
if (urlsplit[1] != null) {
    urlsplit2 = urlsplit[1].split("&");
    urlsplit3 = urlsplit2[0].split("=");
    latitude = urlsplit3[1];
    urlsplit4 = urlsplit2[1].split("=");
    longitude = urlsplit4[1];
}


var mappos = new google.maps.LatLng(latitude, longitude);
var markerpos = new google.maps.LatLng(latitude, longitude);
var marker;
var map;
var lat;
var lng;


// Author: Karim El-Bawab
// Team: 4
// Method name: initialize
// Function: This function is used in order to initiate a map
// that has specific features.

function initialize() {
    
    var mapOptions = {
        zoom: 13,
        center: mappos
    };

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    marker = new google.maps.Marker({
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP,
        position: markerpos
    });
    google.maps.event.addListener(marker, 'click', toggleBounce);
    console.log(marker.getPosition().lat());
    console.log(marker.getPosition().lng());
    
}

// Author: Karim El-Bawab
// Team: 4
// Method name: toggleBounce
// function: This function is used to initiate an animated marker 
// that can be moved by the user to locate his address accurately.
// Whenever the user click on the marker the coordinates of his 
// address will be written in the url and the page will reload 
// again with the new coordinates on the map. 

function toggleBounce() {
    if (marker.getAnimation() != null) {
        marker.setAnimation(null);

    } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
        lat = marker.getPosition().lat();
        lng = marker.getPosition().lng();

    }

    if (latitude != lat || longitude != lng) {
        var url = window.location.href;
        var urlsplit = url.split("?");
        url = urlsplit[0] + "?lat=" + lat + "&lng=" + lng;
        latitude = lat;
        longitude = lng;
        window.location.href = url;



    }
}

google.maps.event.addDomListener(window, 'load', initialize);
