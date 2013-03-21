$(document).ready(function() {
    var userId = '';

    if ($('.complete-story').length > 0) {

        $('div.slice').each(function() {
            $(this).hover(function() {
                userId = $(this).attr('id');

                $(this).addClass('muted');
                $(".contributors #" + userId).addClass('active-contributor');
            }, function() {
                $(this).removeClass('muted');
                $(".contributors #" + userId).removeClass('active-contributor');
            });

        });

    }

});

