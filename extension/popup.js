$(".wants").click(function() {
    $.ajax("localhost:3000/drinks/" + localStorage['token'] + "/wants", {type: "jsonp"})
});

$(".making").click(function() {
    $.ajax("localhost:3000/drinks/" + localStorage['token'] + "/making", {type: "jsonp"})
});

$(".edit").click(function() {
    var token = localStorage['token'];
    chrome.tabs.create({'url': 'http://coffeespec.herokuapp.com/drinks/' + token + '/edit'});
});