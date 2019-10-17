// Handles response from user_controller#handle_admin_approval.
$(document).on('turbolinks:load', function () {
  $('[ajax-toggle-admin-approval]').on('ajax:success', function (
    event,
    data,
    status,
    xhr
  ) {
    if (xhr.responseJSON.result) {
      var selector = '[user-id=' + xhr.responseJSON.user_id + ']'
      var checked_state = xhr.responseJSON.checked_state
      $(selector).prop('checked', checked_state)
      if (checked_state) {
        default_toastr(
          'success',
          'Admin approved.',
          'This user can now log in.'
        )
      } else {
        default_toastr(
          'success',
          'Admin denied.',
          'This user will not able to log in.'
        )
      }
    } else {
      generic_error_toast()
    }
  })
})
