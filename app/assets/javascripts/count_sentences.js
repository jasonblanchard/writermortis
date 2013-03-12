$(document).ready(function() {

    if ($('input[name="commit"]')) {

        $('input[name="commit"]').after('<div class="sentence-update pull-right">You have written 0 sentences</div>');

        $('#slice_body').keyup(function() {

            $('.sentence-update').html('');

            var sentences = $('textarea#slice_body').val().match(/([^\r\n.!?]+([.!?]+|$))/gim);

            if (sentences != null) {
                $('.sentence-update').html('You have written ' + sentences.length + ' sentences.');
            } else {
                $('.sentence-update').html('You have written 0 sentences');
            }

        });

    }

});
