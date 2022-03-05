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

function MasterValidate() {
	if (ValidatePassword() && CheckPassword()) {
		return true;
	} else {
		return false;
	}
}	