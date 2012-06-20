var bg = chrome.extension.getBackgroundPage();

$(".wants").click(function() {
    bg.wants();
});

$(".making").click(function() {
    bg.making();
});

$(".edit").click(function() {
    bg.edit();
});