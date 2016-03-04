  $(document).on('click', '.menu-button', function(e) {
  $("#menu").toggleClass('open');
  $(this).html($(this).html() == 'Close Menu' ? 'Menu' : 'Close Menu');
  e.preventDefault();
});
