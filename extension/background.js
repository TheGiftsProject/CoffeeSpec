chrome.extension.onRequest.addListener(
function(request, sender, sendResponse) {
    alert(request.token);
});
