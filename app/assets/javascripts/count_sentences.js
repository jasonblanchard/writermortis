$(document).ready(function() {

    if ($('textarea#slice_body').length > 0) {

        $('input[name="commit"]').after('<div class="sentence-update pull-right">You have written 0 sentences</div>');
        
        $('textarea#slice_body').bind('input propertychange', function() {
            $('.sentence-update').html('');

            var sentences = $('textarea#slice_body').val().match(/([^\r\n.!?]+([.!?]+|$))/gim);

            if (sentences != null) {
                $('.sentence-update').html('You have written ' + sentences.length + ' sentences.');
            } else {
                $('.sentence-update').html('You have written 0 sentences');
            }

        });

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
