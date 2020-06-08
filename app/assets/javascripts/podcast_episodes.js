$(document).on(
  'change',
  "input[type='checkbox'][id='podcast_episode_create_new_podcast_option']",
  function () {
    if (this.checked) {
      $('.new_podcast')
        .removeClass('new_podcast_hide')
        .addClass('new_podcast_show')
      $('.existing_podcast')
        .removeClass('existing_podcast_show')
        .addClass('existing_podcast_hide')
    } else {
      $('.existing_podcast')
        .removeClass('existing_podcast_hide')
        .addClass('existing_podcast_show')
    }
  }
)
