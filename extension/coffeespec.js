var port = chrome.extension.connect();
$('.itsme').removeClass('hidden').click(function() {
    var token = $(this).data('token');
    chrome.extension.sendRequest({token: token});
});
