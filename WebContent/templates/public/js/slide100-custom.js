(function ($) {
    "use strict";
    $(document).ready(function() {
        $('#slide100-01').slide100({
            autoPlay: "false",
            timeAuto: 3000,
            deLay: 400,

            linkIMG: [
            'images/pro-detail-01.jpg',
            'images/pro-detail-02.jpg',
            'images/pro-detail-03.jpg',
            'images/pro-detail-04.jpg'
            ],

            linkThumb: [
            'images/pro-detail-thumb-01.jpg',
            'images/pro-detail-thumb-02.jpg',
            'images/pro-detail-thumb-03.jpg',
            'images/pro-detail-thumb-04.jpg'
            ]
        });
    });
})(jQuery);