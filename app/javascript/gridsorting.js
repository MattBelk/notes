document.addEventListener("turbolinks:load", () => {

  // Initialises grids with masonry-layout
  $('.grid').masonry({
    // options
    itemSelector: '.grid-item',
  });

  // Functions for jquery-ui sortable
  $("#pinned, #unpinned").sortable({
    items: "> div.grid-item",
    update: function(event, ui) {

      ui.item.addClass('grid-item');
      ui.item.parent().masonry('reloadItems');
      ui.item.parent().masonry();
      
      var id = ui.item[0].id;
      var newPosition = $(ui.item).index(".grid-item") + 1;
      var gridId = ui.item[0].parentElement.id;

      // Sends an ajax request to NotesController#sort, 
      // which updates position in database
      Rails.ajax({
        // data-url set in _notes.html.erb, sends request to sort_notes_path
        url:$(this).data("url"),
        type: "PATCH",
        data: $.param({ id: id, position: newPosition, gridId: gridId }),
      });
      // console.log(ui); 
      // console.log($(this).sortable('serialize'));    
        },
    start:  function(event, ui) {            
      // console.log(ui); 
      ui.item.removeClass('grid-item');
      ui.item.parent().masonry('reloadItems')
      ui.item.parent().masonry();
        },
    change: function(event, ui) {
      ui.item.parent().masonry('reloadItems');
      ui.item.parent().masonry();
        },
    stop:   function(event, ui) { 
      ui.item.addClass('grid-item');
      ui.item.parent().masonry('reloadItems');
      ui.item.parent().masonry();
        }
  });

  // Used in views when editing/pinning/unpinning notes, etc...
  window.reloadGrids = function() {
    // Reloads
    $(".grid").masonry('reloadItems');
    $(".grid").masonry();

    // Reloads masonry layout after images loaded, uses imagesloaded package
    $("action-text-attachment > figure").imagesLoaded( () => {
        $('.grid').masonry();
    });
  };

});