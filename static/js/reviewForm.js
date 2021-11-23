$('#reviewPost').on('submit', () => {
    // let reviewPosting = {
    //     volume_id: $('#volume_id').val(),
    //     title: $('#volume_title').val(),
    //     review_title: $('#reviewTitle').val(),
    //     review: $('#reviewPost').val(),
    // }
    const formPost = $('#formPost').serialize(); 
    $.post('/add_review', formPost)


});