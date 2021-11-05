let userPassword = document.getElementById('password')
let capLetter = document.getElementById('capLetter')
let lowLetter = document.getElementById('lowLetter')
let number = document.getElementById('number')
let length = document.getElementById('length')
let confirm_password = document.getElementById('confirm-pw')

// shows when user clicks on password field
userPassword.onfocus = () => {
    document.getElementById("pwMessage").style.display = "block";
}

//hides message box when user clicks outside of password field
userPassword.onblur = () => {
    document.getElementById("pwMessage").style.display = "none";
}

//when user types in password field
userPassword.onkeyup = () => {
    //validating lowercase words
    let lowerLetters = /[a-z]/g;
    if(userPassword.value.match(lowerLetters)){
        lowLetter.classList.remove("invalid");
        lowLetter.classList.add("valid");
    } else{
        lowLetter.classList.remove("valid");
        lowLetter.classList.add("invalid");
    }

    //validating capital words
    let upperLetters = /[A-Z]/g;
    if(userPassword.value.match(upperLetters)){
        capLetter.classList.remove("invalid");
        capLetter.classList.add("valid");
    } else {
        capLetter.classList.remove("valid");
        capLetter.classList.add("invalid");
    }

    //validating numbers
    let numbers = /[0-9]/g;
    if(userPassword.value.match(numbers)){
        number.classList.remove("invalid");
        number.classList.add("valid");
    } else {
        number.classList.remove("valid");
        number.classList.add("invalid");
    }

    //checking length of password
    if(userPassword.value.length >=8 && userPassword.value.length <= 20){
        length.classList.remove("invalid");
        length.classList.add("valid");
    } else {
        length.classList.remove("valid");
        length.classList.add("invalid");
    }
}

//checking to see if password and confirm-pw match

const confirmPassword = () => {
    if(userPassword.value != confirm_password.value){
        confirm_password.setCustomValidity("Passwords do not match");
    } else {
        confirm_password.setCustomValidity("");
    }
}

userPassword.onchange = confirmPassword;
confirm_password.onkeyup = confirmPassword;