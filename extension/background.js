chrome.extension.onRequest.addListener(
function(request, sender, sendResponse) {
    if (request.type == "status_check") {
        sendResponse({token: localStorage['token']})
    }
    else {
        localStorage['token'] = request.token;
    }
});

function wants() {
    $.ajax("http://localhost:3000/drinks/" + localStorage['token'] + "/wants", {type: "GET"});
}

function making() {
    $.ajax("http://localhost:3000/drinks/" + localStorage['token'] + "/making", {type: "GET"});
    var notification = webkitNotifications.createHTMLNotification("notification.html");
    notification.show();
}

function edit() {
    var token = localStorage['token'];
    chrome.tabs.create({'url': "http://localhost:3000/drinks/" + token + '/edit'});
}
