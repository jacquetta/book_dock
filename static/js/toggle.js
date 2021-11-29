// TOGGLE FOR MORE BUTTON IN BOOK LIST

function btnToggle(ID){
    let book_id = document.getElementById(ID)
    if(book_id.style.display === "none"){
        book_id.style.display = "block";
    } else {
        book_id.style.display = "none";
    }
}