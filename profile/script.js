var $bio = $('<p id="r">Name : Omar Sherif<br/>Age : 21<br/>Education : German University in Cairo </p>');
var $fb = $('<a id = "f"href="http://medias.unifrance.org/medias/122/88/22650/format_page/omar-sharif.jpg">link</a>');
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
