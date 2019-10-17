// Handle response from comments_controller#destroy
$(document).on('turbolinks:load', function () {
  $('[ajax-delete-comment]').on('ajax:success', function (
    event,
    data,
    status,
    xhr
  ) {
    var blog_post_comment_deleted = xhr.responseJSON.blog_post_comment_deleted
    var blog_post_comment_count = xhr.responseJSON.blog_post_comment_count
    var comment_id = xhr.responseJSON.comment_id

    if (blog_post_comment_deleted === true) {
      // Hide the deleted comment.
      $('#comment-' + comment_id).fadeOut(650)

      // Hide the entire comments container if the post has no remaining comments.
      if (blog_post_comment_count === 0) {
        $('#comments-container').fadeOut(650)
      }

      // Show a confirmation toast.
      default_toastr(
        'success',
        'Comment deleted!',
        "And just like that, pffft. It's gone!"
      )
    } else {
      generic_error_toast()
    }
  })
})
