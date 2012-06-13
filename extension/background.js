chrome.extension.onRequest.addListener(
function(request, sender, sendResponse) {
    if (request.type == "status_check") {
        sendResponse({token: localStorage['token']})
    }
    else {
        localStorage['token'] = request.token;
    }
});
