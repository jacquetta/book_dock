'use strict';

// DELETE BOOKUSER ON SUBMIT BUTTON
$('#deleteItem').on('submit', function(evt) {
    evt.preventDefault();
    const bookUserId = {
        bookuser_id : $('#bookuser_id').val()
    };
    $.get('/delete_bookuser', bookUserId, res => {
        $(this).closest("li").remove();
    });
});

// BACK HISTORY BUTTON
function goBack() {
    window.history.back();
}

// COUNTDOWN TIMER FOR GOAL DATE
let countDownDate = document.getElementById('goalDate').innerHTML;
let goalDate = new Date(countDownDate);


const countdownGoal = setInterval(function(){
    let currentDate = new Date();
    let distanceGoal = goalDate - currentDate;
    let days = Math.floor(distanceGoal / (1000 * 60 * 60 * 24));

    //display results to html
    document.getElementById('countdownTimer').innerHTML =`${days} days left`;
    //when count down reaches 0
    if(distanceGoal < 0){
        clearInterval(countdownGoal);
        document.getElementById("countdownTimer").innerHTML = "GOAL DATE EXPIRED";
    }
}, 1000);

//BOOKS READ IN COMPLETED 
let listUL = document.getElementById('finished-list');
console.log(listUL);
let listItems = [];
for(let i = 0; i < listUL.childNodes.length; i++){
    if(listUL.childNodes[i].nodeName == "LI"){
        listItems.push(listUL.childNodes[i]);
    }
}
const data = collect(listItems);
const num = data.count();
// console.log(listItems)
document.getElementById('bookGoals').innerHTML = num;