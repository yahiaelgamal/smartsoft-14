var $bio = $('<p id="r">Name : Omar Sherif<br/>Age : 21<br/>Education : German University in Cairo </p>');
var $fb = $('<a id = "f"href="http://www.facebook.com/3omarsherif">link</a>');
$(document).ready(function(){

$('#bio').hover(function(){
    $('#screen').append($bio);
}
,
function(){$('#r').remove();});


$('#fb').mouseenter(function(){
    $('#screen').append($fb);
});



});
