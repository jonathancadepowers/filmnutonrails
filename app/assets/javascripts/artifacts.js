$(document).on('ready turbolinks:load', function () {
  //Displays the name of a recently uploaded file in a user-friendly format.
  $('.custom-file-input').change(function () {
    var file_name = this.value
    file_name = file_name.replace(/C:\\fakepath\\/g, '')
    file_name = file_name
      .split('.')
      .slice(0, -1)
      .join('.')
    $('.custom-file-label').text(file_name)
    $('#artifact_title').val(file_name)
  })
  //Handles the "copy to clipboard" link.
  //Copies the uploaded file's URL to the user's clipboard.
  $('[ajax-clipboard-copy]').on('ajax:success', function (
    event,
    data,
    status,
    xhr
  ) {
    textToClipboard(xhr.responseJSON['clipboard_contents'])
  })
})
