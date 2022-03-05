function ValidatePasswordLog() {
	var Pass1 = document.getElementById("PassLog").value.trim();
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
			document.getElementById("Pass1MsgLog").innerHTML =" **Are you sure this is the valid password? ";
			return false;		
		}
		else {
			Sp++;
		}
	} if (L>0 && U>0 && D>0 && Sp>0 && Pass1.length>7) {
		document.getElementById("Pass1MsgLog").innerHTML ="";
			return true;
	} else {
		document.getElementById("Pass1MsgLog").innerHTML =" **Are you sure this is the valid password? ";
			return false;
	}
}

function ValidateUsernameLog() {
	var Username = document.getElementById("UserLog").value.trim();
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
			document.getElementById("UserMsgLog").innerHTML =" **Username is not matching to our criteria. ";
			return false;
		}
	} if (Al>0 && Di>0 && Username.length>7) {
		document.getElementById("UserMsgLog").innerHTML ="";	
		return true;
	} else {
		document.getElementById("UserMsgLog").innerHTML =" **Username is not matching to our criteria. ";
		return false;
	}
}

function MasterValidateLog() {
	if (ValidateUsernameLog() && ValidatePasswordLog()) {
		return true;
	} else {
		return false;
	}
}