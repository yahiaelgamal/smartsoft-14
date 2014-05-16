// Author : Karim El-Bawab
// Team: 4
// Script name: google_maps_routes0
// Function: This script is responsible for viewing 
// the map of the route   
var directionsDisplay = new google.maps.DirectionsRenderer();
var directionsService = new google.maps.DirectionsService();

function calcRoute() {

    var origin = new google.maps.LatLng(gon.retailerLat, gon.retailerLng);
    var destination = new google.maps.LatLng(gon.retailerLat, gon.retailerLng);

    var arr = [];
    var arrOfPoints = gon.arrOfPoints;

    for (index = 0; index < arrOfPoints.length; ++index) {
        console.log(arrOfPoints[index]);
        var destination1 = new google.maps.LatLng(arrOfPoints[index][0], arrOfPoints[index][1]);

        arr.push({
            location: destination1,
            stopover: true
        });
    }

    var request = {
        origin: origin,
        destination: destination,
        waypoints: arr,
        optimizeWaypoints: true,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}

calcRoute();

var handler = Gmaps.build('Google');
handler.buildMap({
    internal: {
        id: 'map'
    }
}, function () {
    directionsDisplay.setMap(handler.getMap());
});


directionsDisplay.setPanel(document.getElementById('directions-panel'));
