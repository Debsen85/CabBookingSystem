function ValidateName() {
	var Name = document.getElementById("Name").value.trim();
	var Al=0;
	var Sp=0;
	for(var i=0; i<Name.length; i++) {
		if ((Name.charAt(i)).match(/[a-z]/i)) {
			Al++;		
		}
		else if (Name.charAt(i)==" ") {
			Sp++;
		}
		else {
			document.getElementById("NameMsg").innerHTML =" **Name is not valid. ";
			return false;
		}
	}
	if (Sp<=1 && Name.length>8) {
		document.getElementById("NameMsg").innerHTML ="";	
		return true;
	} else {
		document.getElementById("NameMsg").innerHTML =" **Name is not valid. ";	
		return false;
	}				
}

function ValidateAge() {
	var Age = parseInt(document.getElementById("Age").value.trim());
	if (Age>=15 && Age<=80) {
		document.getElementById("AgeMsg").innerHTML ="";	
		return true;
	} else {
		document.getElementById("AgeMsg").innerHTML =" **Age is not valid. ";	
		return false;
	}
}

function ValidatePhone() {
	var Phone = document.getElementById("Phone").value.trim();
	if (Phone.length==10 && Phone.match("(7|8|9).*")) {
		document.getElementById("PhoneMsg").innerHTML ="";	
		return true;
	} else {
		document.getElementById("PhoneMsg").innerHTML =" **Number is not valid. ";	
		return false;
	}
}
		
function ValidateUsername() {
	var Username = document.getElementById("Username").value.trim();
	var Al=0;
	var Di=0;
	for(var i=0; i<Username.length; i++) {
		if ((Username.charAt(i)).match(/[a-z]/i)) {
			Al++;		
		}
		else if (Username.charAt(i).match(/[0-9]/)) {
			Di++;
		}
		else {
			document.getElementById("UserMsg").innerHTML =" **Username is not valid. ";
			return false;
		}
	} if (Al>0 && Di>0 && Username.length>7) {
		document.getElementById("UserMsg").innerHTML ="";	
		return true;
	} else {
		document.getElementById("UserMsg").innerHTML =" **Username is not valid. ";
		return false;
	}
}

function ValidatePassword() {
	var Pass1 = document.getElementById("Pass1").value.trim();
	var U=0;
	var L=0;
	var D=0;
	var Sp=0;
	for(var i=0; i<Pass1.length; i++) { 
		if ((Pass1.charAt(i)).match(/[a-z]/)) {
			L++;		
		}
		else if (Pass1.charAt(i).match(/[0-9]/)) {
			D++;
		}
		else if ((Pass1.charAt(i)).match(/[A-Z]/)) {
			U++;		
		}
		else if ((Pass1.charAt(i))==" ") {
			document.getElementById("Pass1Msg").innerHTML =" **Password is not valid. ";
			return false;		
		}
		else {
			Sp++;
		}
	} if (L>0 && U>0 && D>0 && Sp>0 && Pass1.length>7) {
		document.getElementById("Pass1Msg").innerHTML ="";
			return true;
	} else {
		document.getElementById("Pass1Msg").innerHTML =" **Password is not valid. ";
			return false;
	}
}

function CheckPassword() {
	var Pass1 = document.getElementById("Pass1").value.trim();
	var Pass2 = document.getElementById("Pass2").value.trim();
	if (Pass1===Pass2) {
		document.getElementById("Pass2Msg").innerHTML ="";
			return true;
	} else {
		document.getElementById("Pass2Msg").innerHTML =" **Password mismatch. ";
			return false;
	}
}

function ValidateEmail() {
	var Email = document.getElementById("Email").value.trim();
	if (Email.match(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/)) {
		document.getElementById("EmailMsg").innerHTML ="";
			return true;
	} else {
		document.getElementById("EmailMsg").innerHTML =" **Email is not valid. ";
			return false;
	}
}

function MasterValidate() {
	if (ValidateName() && ValidateAge() && ValidatePhone() && ValidateUsername() && ValidatePassword() && CheckPassword() && ValidateEmail()) {
		return true;
	} else {
		return false;
	}
}	