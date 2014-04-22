// The following codee creates a marker in the member address
// using a DROP animation. Clicking on the marker will toggle
// the animation between a BOUNCE animation and no animation.

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
