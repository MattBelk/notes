document.addEventListener("turbolinks:load", () => {

  window.removeNote = function(id) {
    $(`#${id}`).remove();
  };

  window.addToPinned = function(htmlString) {
    $("#pinned").append(htmlString);
  };

  window.addToUnpinned = function(htmlString) {
    $("#unpinned").prepend(htmlString);
  };

  window.updateNoteHeadings = function() {
    var pinnedCount = $("#pinned .grid-item").length;
    var normalCount = $("#unpinned .grid-item").length;

    updateNoteHeading("pinned", pinnedCount);
    updateNoteHeading("unpinned", normalCount);

  };

  function updateNoteHeading(containerId, count) {
    if (count >= 2) {
      $(`#${containerId}`.concat("-stats")).html(`${count}`.concat(` ${containerId} notes`));
    } else if (count == 0) {
      $(`#${containerId}`.concat("-stats")).html("");
    } else {
      $(`#${containerId}`.concat("-stats")).html(`${count}`.concat(` ${containerId} note`));
    }

  };

});