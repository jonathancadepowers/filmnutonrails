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
