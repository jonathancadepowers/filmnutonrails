// Swaps out the "edit podcast series" link when a user selects a new existing podcast series.
$(document).on('change', '.parent_select', function () {
  $.ajax({
    url: $(this).attr('route'),
    data: { selected_podcast_id: this.value },
    dataType: 'text',
    success: function (data) {
      $('#parent_edit_link').replaceWith(data)
    },
    error: function (exception) {
      // Show an error toast.
      generic_error_toast()
    }
  })
})
