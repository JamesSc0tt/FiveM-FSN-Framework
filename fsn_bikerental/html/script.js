$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "enableui") {
            document.body.style.display = event.data.enable ? "block" : "none";
        }
    });
    
    document.onkeyup = function (data) {
        if (data.which == 27) { // Escape key
            $.post('http://fsn_bikerental/escape', JSON.stringify({}));
        }
    };
    
});
