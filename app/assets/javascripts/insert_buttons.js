$(document).ready( function() {

    var inputBox = $('textarea#slice_body');
    var newVal = '';

    $('button.continue-line').click( function() {
        newVal = inputBox.val().replace(/^\s+|\s+$/g, '');
        inputBox.focus().val("").val(newVal);
    });

    $('button.new-line').click( function() {
        var val = inputBox.val().replace(/^\s+|\s+$/g, '');
        newVal = '\n' + val;
        inputBox.focus().val("").val(newVal);
    });

    $('button.new-paragraph').click( function() {
        var val = inputBox.val().replace(/^\s+|\s+$/g, '');
        newVal = '\n\n' + val;
        inputBox.focus().val("").val(newVal);
    });

});
