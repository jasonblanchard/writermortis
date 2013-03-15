$(document).ready(function() {

    if ($('textarea#slice_body').length > 0) {

        $('.rules').hide();

        $('input[name="commit"]').after('<div class="sentence-update pull-right">This story allows ' + maxSentences + ' sentences. You have written 0 sentences</div>');

        updateSentenceCount();

        $('textarea#slice_body').bind('input propertychange', function() {
            updateSentenceCount();
        });

        $('#slice_body').keyup(function() {
            updateSentenceCount();
        });

    }

});

function updateSentenceCount() {

    $('.sentence-update').html('');

    var sentences = $('textarea#slice_body').val().match(/([^\r\n.!?]+([.!?]+|$))/gim);

    if (sentences != null) {
        $('.sentence-update').html('This story allows ' + maxSentences + ' sentences. You have written ' + sentences.length + ' sentences.');
    } else {
        $('.sentence-update').html('This story allows ' + maxSentences + ' sentences. You have written 0 sentences');
    }

}

