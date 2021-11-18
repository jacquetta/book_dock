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