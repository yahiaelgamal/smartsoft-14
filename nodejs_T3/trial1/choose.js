function dropdown(){
	var dropdownlist = document.getElementById("dropdownlist");
	var selected = dropdownlist.options[dropdownlist.selectedIndex].value;
	if(selected == "add new todo list"){
		var text = prompt("insert new name for the new todo list");
window.location='myPage.html';		 
//window.open("myPage.html"+'?'+text,"");
	}else{
		if(selected == "select a todo list")
			alert("please choose an option");
		else{
			//load todo list from server
		}
	}
}