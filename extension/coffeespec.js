// add buttons.

var port = chrome.extension.connect();
document.getElementById('myCustomEventDiv').addEventListener('myCustomEvent', function() {
    var eventData = document.getElementById('myCustomEventDiv').innerText;
    port.postMessage({message: "myCustomEvent", values: eventData});
});