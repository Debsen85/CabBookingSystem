function ValidateName1() {
	var Name = document.getElementById("Name1").value.trim();
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
			document.getElementById("NameMsg1").innerHTML =" **Name is not valid. ";
			return false;
		}
	}
	if (Sp<=1 && Name.length>8) {
		document.getElementById("NameMsg1").innerHTML ="";	
		return true;
	} else {
		document.getElementById("NameMsg1").innerHTML =" **Name is not valid. ";	
		return false;
	}				
}

function ValidateName2() {
	var Name = document.getElementById("Name2").value.trim();
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
			document.getElementById("NameMsg2").innerHTML =" **Name is not valid. ";
			return false;
		}
	}
	if (Sp<=1 && Name.length>8) {
		document.getElementById("NameMsg2").innerHTML ="";	
		return true;
	} else {
		document.getElementById("NameMsg2").innerHTML =" **Name is not valid. ";	
		return false;
	}				
}

function ValidateName3() {
	var Name = document.getElementById("Name3").value.trim();
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
			document.getElementById("NameMsg3").innerHTML =" **Name is not valid. ";
			return false;
		}
	}
	if (Sp<=1 && Name.length>8) {
		document.getElementById("NameMsg3").innerHTML ="";	
		return true;
	} else {
		document.getElementById("NameMsg3").innerHTML =" **Name is not valid. ";	
		return false;
	}				
}

function ValidateContact1() {
	var Phone = document.getElementById("Contact1").value.trim();
	if (Phone.length==10 && Phone.match("(7|8|9).*")) {
		document.getElementById("ContactMsg1").innerHTML ="";	
		return true;
	} else {
		document.getElementById("ContactMsg1").innerHTML =" **Number is not valid. ";	
		return false;
	}
}

function ValidateContact2() {
	var Phone = document.getElementById("Contact2").value.trim();
	if (Phone.length==10 && Phone.match("(7|8|9).*")) {
		document.getElementById("ContactMsg2").innerHTML ="";	
		return true;
	} else {
		document.getElementById("ContactMsg2").innerHTML =" **Number is not valid. ";	
		return false;
	}
}

function ValidateContact3() {
	var Phone = document.getElementById("Contact3").value.trim();
	if (Phone.length==10 && Phone.match("(7|8|9).*")) {
		document.getElementById("ContactMsg3").innerHTML ="";	
		return true;
	} else {
		document.getElementById("ContactMsg3").innerHTML =" **Number is not valid. ";	
		return false;
	}
}

function ValidateCT1() {
	var CT = document.getElementById("CT").value.trim();
	if (CT.match("Bike") || CT.match("Sedan") || CT.match("Mini") || CT.match("Premium")) {
		document.getElementById("CarType").innerHTML ="";	
		return true;
	} else {
		document.getElementById("CarType").innerHTML =" **Car type is not valid. ";	
		return false;
	}
}

function ValidateCN1() {
	var CN = document.getElementById("CN").value.trim();
	if (CN.match(/^WB-[A-Z]+-([0-9]{4})$/)) {
		document.getElementById("CarNumber").innerHTML ="";	
		return true;
	} else {
		document.getElementById("CarNumber").innerHTML =" **Car number is not valid. ";	
		return false;
	}
}

function MasterValidate1() {
	if (ValidateName1() && ValidateContact1() && ValidateCT1() && ValidateCN1()) {
		return true;
	}
	return false;
}

function MasterValidate2() {
	if (ValidateName2() && ValidateContact2()) {
		return true;
	}
	return false;
}

function MasterValidate3() {
	if (ValidateName3() && ValidateContact3()) {
		return true;
	}
	return false;
}