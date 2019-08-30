//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require activestorage
//= require tinymce
//= require_tree .
//= require popper
//= require bootstrap-sprockets
//= require toastr

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
