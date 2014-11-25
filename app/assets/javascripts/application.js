//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require bootstrap-sprockets
//= require jquery.livesearch
//= require jquery.dataTables.min
//= require jquery.quicksearch
//= require jquery.filtertable.min
//= require turbolinks
//= require_tree .

$(function() {
  initPage();
});
$(window).bind('page:change', function() {
  initPage();
});
function initPage() {
  // Page ready code...

    



$('input#q_name_cont').quicksearch('table tbody tr');                              

}