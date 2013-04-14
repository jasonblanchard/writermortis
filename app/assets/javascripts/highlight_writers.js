$(document).ready(function() {
    var userId = '';

    if ($('.complete-story').length > 0) {

        $('a.slice').each(function() {
            $(this).click(function() {
                return false;
            });

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

