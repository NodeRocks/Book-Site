(function() {

  $(function() {
    var froogaloop;
    froogaloop = $f('#player');
    return froogaloop.bind('onLoad', function() {
      return console.log('Ready!');
    });
  });

}).call(this);
