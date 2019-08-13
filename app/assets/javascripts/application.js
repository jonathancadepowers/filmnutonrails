//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require activestorage
//= require_tree .
//= require popper
//= require bootstrap-sprockets
//= require toastr

function get_default_success_toastr (title, message) {
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
    timeOut: '3000',
    extendedTimeOut: '1000',
    showEasing: 'swing',
    hideEasing: 'linear',
    showMethod: 'fadeIn',
    hideMethod: 'fadeOut'
  }
  toastr['success'](message, title)
}
