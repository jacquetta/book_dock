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


// UPDATE PROFILE ON SUBMIT
$('#updateBtn').on('submit', () => {
    const updateForm = $('#updateForm').serialize(); 
    $.get('/update_profile', updateForm);
});