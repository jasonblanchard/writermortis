$(document).ready(function() {
        
    $('.rules').hide();

    if ($('textarea#slice_body').length > 0) {

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
    var span = "";
    var sentencesLeft;
    var plural;

    if (sentences != null) {
   
        sentencesLeft = maxSentences - sentences.length

        if (sentences.length > maxSentences) {
            span = "red";
        } else {
            span = "green";
        }

        if (sentencesLeft == 1) {
            plural = "sentence";
        } else {
            plural = "sentences";
        }

        $('.sentence-update').html('This story allows ' + maxSentences + ' sentences. <span class="' + span + '"> You can write ' + (sentencesLeft) + ' more ' + plural + '.</span>');
    } else {
        $('.sentence-update').html('This story allows ' + maxSentences + ' sentences. <span class="' + span + '">You have written 0 sentences.</span>');
    }

}

