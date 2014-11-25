jQuery ->
  # Ajax sorting and pagination on click
  $('#customers td.sortable a, #customers .pagination a').live('click', ->
    $.getScript(this.href)
    false
  )
  # Ajax search on submit
  $('#customers_search').submit( ->
    $.get(this.action, $(this).serialize(), null, 'script')
    false
  )
  # Ajax search on keyup
  $('#customers_search input').keyup( ->
    $.get($("#customers_search").attr("action"), $("#customers_search").serialize(), null, 'script')
    false
  )