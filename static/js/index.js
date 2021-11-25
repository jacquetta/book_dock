// TOGGLE FOR MORE BUTTON IN BOOK LIST

// $('.toggleBtn').click(function (evt) {
//     let btn = evt.target.id;
//     btn.toggle();
// });
// let book_id = $('.moreInfo').attr('id');
// let btn = $('.toggleBtn').attr('id');
// $("#" + btn).click(function () {
//     $("#" + book_id).toggle();
// });

// $('.toggleBtn').click( ()  => {
//     let p = document.getElementsByClassName('moreInfo')
//     let moreInfo = p.id;
//     moreInfo.toggle();
// });

// $('.toggleBtn').toggle(getId);

// $("toggleBtn").click(function(evt){
//     let p = document.getElementsByClassName('moreInfo')
//     let moreInfo = p.id;
//     console.log(moreInfo)
//     $("p").toggle();
//   });


// let book_id = $('.moreInfo').attr('id')
// let btn_id = $('.toggleBtn').attr('id')

function btnToggle(ID){
    let book_id = document.getElementById(ID)
    if(book_id.style.display === "none"){
        book_id.style.display = "block";
    } else {
        book_id.style.display = "none";
    }
}

$('#delete_bookuser').on('submit', function(evt) {
    evt.preventDefault();
    const bookUserId = {
        bookuser : $('#bookuser').val()
    };
    $.get('/delete_bookuser', bookUserId, res => {
        $(this).closest("li").remove();
    });
});

function goBack() {
    window.history.back();
}

// countdown timer for goal date

let = countDownDate = document.getElementById('goalDate').innerHTML;
// countDown = new Date(countDownDate).getTime();
// console.log(typeof(countDownDate));
let goalDate = new Date(countDownDate);

// console.log(typeof(current));

// calculations for days
const countdownGoal = setInterval(function(){
    let currentDate = new Date();
    // let current = currentDate.toLocaleDateString();
    let distanceGoal = goalDate - currentDate;
    // console.log(distanceGoal)
    let days = Math.floor(distanceGoal / (1000 * 60 * 60 * 24));

    //display results to html
    document.getElementById('countdownTimer').innerHTML =`${days} left`;
    //when count down reaches 0
    if(distanceGoal < 0){
        clearInterval(countdownGoal);
        document.getElementById("countdownTimer").innerHTML = "GOAL DATE EXPIRED";
    }
}, 1000);