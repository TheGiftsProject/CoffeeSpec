var port = chrome.extension.connect();

chrome.extension.sendRequest({type: "status_check"}, function(resp) {
    if (!resp.token) {
        $('.itsme').removeClass('hidden').click(function() {
            var token = $(this).data('token');
            chrome.extension.sendRequest({token: token});
            $('.itsme').addClass('hidden');
        });
    };
});
