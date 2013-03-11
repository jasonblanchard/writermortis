$(document).ready( function() {

    var inputBox = $('textarea#slice_body');
    var newVal = '';

    $('button.continue-line').click( function() {
    });

    $('button.new-line').click( function() {
        newVal = '\n' + inputBox.val()
        inputBox.val('\n' + inputBox.val());
        inputBox.focus().val("").val(newVal);
    });

    $('button.new-paragraph').click( function() {
        newVal = '\n\n' + inputBox.val();
        inputBox.val('\n\n' + inputBox.val());
        inputBox.focus().val("").val(newVal);
    });

});
