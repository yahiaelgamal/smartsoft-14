//Author: Antoine Foti
//Team: 2
//Function: It hides and shows a certain part(div) in the view
function toggle_visibility(id) {
  var e = document.getElementById(id);
  if (e.style.display == 'block') e.style.display = 'none';
  else e.style.display = 'block';
}