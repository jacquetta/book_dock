'use strict';

// REVIEW FORM SUBMIT
$('#reviewBtn').on('click', () => {
    
    let formInput = {
        title: $('#bookTitle').val(),
        bookId: $('#volumeId').val(),
    }
    
    $.post('/review_form', formInput, res => {
        $('#volumeTitle').append(res);
        $('#volumeId').append(res);
    });
});


