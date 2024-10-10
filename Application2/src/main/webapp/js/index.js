/**
 * 
 */
function submenu(){
	
	let menuId = document.getElementById("myaccount");
	let accountStatus = menuId.getAttribute("class");
	let subMenu = document.getElementById("submenu_list_option");
	
	if(accountStatus.includes("menu-disable")){
	  menuId.className="menu-enable";
	  subMenu.style.display="block";	
	}else{
		menuId.className="menu-disable";
		subMenu.style.display="none";	
	}
}
function reset(){
    location.reload();
}

function validate1(){
    let username = document.f1.username.value;
	let password = document.f1.password.value;
	username = username.toLowerCase();
	password = password.toLowerCase();
	let user_name_field_alert = document.getElementById("username-alert-label");
	let password_field_alert = document.getElementById("password-alert-label");
		if((username === "" || username === null)&&(password === "" || password === null)){
		    return false;
		}
		else if(username.includes("'") || username.includes("\/") || username.includes("//") || username.includes("--") || username.includes("or") || username.includes("and") || username.includes("union") || (username.includes("^") || username.includes("@") || username.includes("$") || username.includes("%"))){
		    user_name_field_alert.style.display="block";
		    user_name_field_alert.innerText = "please enter correct username";
		    return false;
		    
		}else if(password.includes("'") || password.includes("\/") || password.includes("//") || password.includes("--") || password.includes("or") || password.includes("and") || password.includes("union")){
		    password_field_alert.style.display="block";
		    password_field_alert.innerText = "please enter correct password";
		    return false;
		}
		else{
		    if(username == "" || username == null){
		     return false;
		 }else if(password == "" || password == null){
		     return false;
		  }
		 }
    return true;  
}

function showPassword(){
	let input_value = document.getElementById("mypassword");
	let type = input_value.getAttribute("type");
	if(type.includes("password")){
       input_value.type = "text";
	}else{
       input_value.type="password";
	}
}


document.addEventListener('DOMContentLoaded', function() {
       function attendee_detail() {
           // Get input field values
           var firstname = document.getElementById("firstname").value;
           var lastname = document.getElementById("lastname").value;

           // Regular expression to allow only alphanumeric characters
           var alphanumericPattern = /^[a-zA-Z]+$/
;

           // Error message element
           var errorMsg = document.getElementById("errorMsg");

           // Validate First Name
           if (!alphanumericPattern.test(firstname)) {
               errorMsg.textContent = "First Name should only contain alphabet characters.";
               errorMsg.style.display = "block"; // Show error message
               return false; // Prevent form submission
           }

           // Validate Last Name
           if (!alphanumericPattern.test(lastname)) {
               errorMsg.textContent = "Last Name should only contain alphabet characters.";
               errorMsg.style.display = "block"; // Show error message
               return false; // Prevent form submission
           }

		   errorMsg.style.display = "none";
           return true; // Allow form submission
       }

       // Attach function to form submission event
       document.querySelector('form').onsubmit = attendee_detail;
   });



