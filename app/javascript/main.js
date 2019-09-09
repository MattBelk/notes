document.addEventListener("turbolinks:load", () => {

  window.onload = () => {
    // console.log("Doing stuff after loaded")
    $(".grid").masonry('reloadItems');
    $(".grid").masonry();
  }

  function smoothScrollTo(selector) {
    if (selector == "body") {
      $('html, body').animate({
        scrollTop: 0
      }, 1000);
    } else {
      $('html, body').animate({
        scrollTop: $(selector).parents().eq(1).offset().top - 60
      }, 1000);
    }
  };

  if ($(".home-scroll").length) {
    $(".home-scroll").on('touchstart mousedown', () => {
      smoothScrollTo("body");
    });
    $("#pinned-scroll").on('touchstart mousedown', () => {
      smoothScrollTo("#pinned");
    });
    $("#unpinned-scroll").on('touchstart mousedown', () => {
      smoothScrollTo("#unpinned");
    });
  };
  

});

import 'gridsorting';
import 'notes';