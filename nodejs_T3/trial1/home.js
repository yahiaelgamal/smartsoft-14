function validate(user,password){
	if(user.value == "mahmoud" && password.value=="123")
		window.open("choose.html?"+user.value+","+password.value);
	else
		alert("please recheck username and password"+user.value+" "+password.value);
}
var button = document.getElementById("theButton"),
value =  button.form.valueId.value;
button.onclick = function() {
    validate(button.form.username.value,button.form.password.value);
};