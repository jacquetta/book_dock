'use strict';
$('#reviewBtn').on('click', () => {
    // let title = document.getElementById('book_title');
    // evt.preventDefault();
    let formInput = {
        title: $('#bookTitle').val(),
        bookId: $('#volumeId').val(),
    }

    console.log(formInput);
    
    $.post('/review_form', formInput, res => {

        $('#volumeTitle').append(res);
        $('#volumeId').append(res);
    });
});