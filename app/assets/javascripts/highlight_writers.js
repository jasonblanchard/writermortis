$(document).ready(function() {

    if ($('.complete-story').length > 0) {

        $('div.slice').each(function() {
            $(this).hover(function() {
                $(this).addClass('muted');
            }, function() {
                $(this).removeClass('muted');
            });

        });

    }

});

