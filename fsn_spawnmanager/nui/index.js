$(function() {
  var selected = false
  window.addEventListener('message', function(event) {
    if (event.data.hide) {
      $('.spawnmenu').hide()
    }
    if (event.data.locs) {
      $('.selections').html('')
      $('.spawnbutton').hide()
      for (i = 0; i < event.data.locs.length; i++) {
        var loc = event.data.locs[i];
        var sel = '';
        if (loc.selected) {
          sel = 'selected'
          $('.spawnbutton').show()
        }
        $('.selections').append('<div class="selection '+sel+'" onclick="camToLoc('+i+')">'+
            loc.name+
        '</div>')
      }
      $('.spawnmenu').show()
    }
  })
})

function camToLoc(id) {
  $.post('http://fsn_spawnmanager/camToLoc', JSON.stringify({
    loc: id
  }))
}

function spawn() {
  $.post('http://fsn_spawnmanager/spawnAtLoc', JSON.stringify({}))
}