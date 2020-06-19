//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require activestorage
//= require tinymce
//= require_tree .
//= require popper
//= require bootstrap-sprockets
//= require toastr
//= require prism
//= require chartkick
//= require Chart.bundle

// Possible types: info, success, warning, error
function default_toastr (type, title, message) {
  toastr.options = {
    closeButton: true, // TODO: This option doesn't work: https://github.com/CodeSeven/toastr/issues/623
    debug: false,
    newestOnTop: true,
    progressBar: false,
    positionClass: 'toast-bottom-right',
    preventDuplicates: true,
    onclick: null,
    showDuration: '300',
    hideDuration: '1000',
    timeOut: '3500',
    extendedTimeOut: '1000',
    showEasing: 'swing',
    hideEasing: 'linear',
    showMethod: 'fadeIn',
    hideMethod: 'fadeOut'
  }
  toastr[type](message, title)
}

function generic_error_toast () {
  default_toastr('error', 'An error occured.', 'Sorry about that. Try again?')
}

function textToClipboard (text) {
  var dummy = document.createElement('textarea')
  document.body.appendChild(dummy)
  dummy.value = text
  dummy.select()
  document.execCommand('copy')
  document.body.removeChild(dummy)
}

// Hides/shows the "existing parent" versus "create new parent" fields within a nested admin form.
$(document).on('change', '.create_new_parent_option', function () {
  if (this.checked) {
    $('.new_parent')
      .removeClass('new_parent_hide')
      .addClass('new_parent_show')
    $('.existing_parent')
      .removeClass('existing_parent_show')
      .addClass('existing_parent_hide')
  } else {
    $('.existing_parent')
      .removeClass('existing_parent_hide')
      .addClass('existing_parent_show')
  }
})

// Swaps out the "edit parent" link HREF when a user selects a new existing parent with a nested admin form.
$(document).on('change', '.parent_select', function () {
  $.ajax({
    url: $(this).attr('route'),
    data: { selected_parent_id: this.value },
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
