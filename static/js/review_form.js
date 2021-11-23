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

$('#reviewPost').on('click', () => {
    // let reviewPosting = {
    //     volume_id: $('#volume_id').val(),
    //     title: $('#volume_title').val(),
    //     review_title: $('#reviewTitle').val(),
    //     review: $('#reviewPost').val(),
    // }
    const formPost = $('#formPost').serialize(); 
    $.post('/add_review', formPost)


});