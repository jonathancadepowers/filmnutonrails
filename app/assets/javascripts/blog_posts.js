$(document).on('turbolinks:load', function () {
  $('[data-js-comment-id]').on('ajax:success', function (
    event,
    data,
    status,
    xhr
  ) {
    var comment_id = xhr.responseJSON.id
    $('#comment-' + comment_id).fadeOut(650)

    get_default_success_toastr(
      'Comment deleted!',
      "And just like that, pffft. It's gone!"
    )
  })
})
