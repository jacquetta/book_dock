// UPDATE PROFILE ON SUBMIT
$('#updateBtn').on('submit', () => {
    const updateForm = $('#updateForm').serialize(); 
    $.get('/update_profile', updateForm);
});