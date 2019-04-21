$(function() {
  $('.js-accordion-trigger').click(function(event) {
    $(event.target)
      .parents('.js-accordion-section')
      .toggleClass('expanded');
  });
});
