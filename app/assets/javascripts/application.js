//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require bootstrap-sprockets
//= require best_in_place
//= require jquery.livesearch
//= require jquery.dataTables.min
//= require jquery.quicksearch
//= require jquery.filtertable.min
//= require bootstrap.markdown.js
//= require bootstrap-markdown-bundle
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


  $("customers th a, #customers .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#customers_search input").keyup(function() {
    $.get($("#customers_search").attr("action"), $("#customers_search").serialize(), null, "script");
    return false;
  });
}