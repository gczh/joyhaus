var removeAccordionDelay = function() {
  $('.collapse').on('show.bs.collapse hide.bs.collapse', function(e) {
    e.preventDefault();
  });
  $('[data-toggle="collapse"]').on('click', function(e) {
    e.preventDefault();
    $($(this).attr('data-target')).toggleClass('in');
  });
}