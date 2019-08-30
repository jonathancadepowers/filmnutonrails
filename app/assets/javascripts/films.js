$(document).on('turbolinks:load', function () {
  // Searches TMDB for a film and returns results.
  $('.tmdb-search-button').click(function () {
    var title = $('.tmdb-search-field').val()

    $.ajax({
      url: '/films/tmdb_search',
      data: { title: title },
      dataType: 'text',
      success: function (data) {
        // Caches a DIV.
        var $tmdb_results = $('.tmdb-results-hidden')

        // Expands a DIV to hold search results.
        $('.tmdb-container')
          .removeClass('tmdb-container')
          .addClass('tmdb-container-expanded')

        // Displays a nested DIV that holds search results.
        $tmdb_results
          .removeClass('tmdb-results-hidden')
          .addClass('tmdb-results-visible')

        // Loops over each film search result.
        // Lists each film by name, next to a checkbox.
        var results = JSON.parse(data)
        for (var i = 0; i < 5; i++) {
          var obj = results[i]
          $tmdb_results.append(
            '<div class="form-check"><input id="checkbox" class="form-check-input" tmdb_id="' +
              obj.tmdb_id +
              '" type="checkbox"><label class="form-check-label">' +
              obj.title +
              ' (' +
              obj.year.slice(0, 4) +
              ')</label></div>'
          )
        }
      },
      error: function (exception) {
        // Show an error toast.
        default_toastr(
          'error',
          'Error: Could not search TMDB.',
          'Sorry about that. Try again?'
        )
      }
    })
  })

  // Retrieves data about the selected film search result.
  // Pushes film attributes into form fields.
  $(document).on('change', 'input:checkbox', function () {
    if (this.checked) {
      $.ajax({
        url: '/films/tmdb_get_film_attributes',
        data: { tmdb_id: $(this).attr('tmdb_id') },
        dataType: 'text',
        success: function (data) {
          // Displays the form that users must complete to submit a film. 
          $('.film-form-hidden')
            .removeClass('film-form-hidden')
            .addClass('film-form-visible')
          
          // Removes the TMDB search box and search results.
          $('.tmdb-container-expanded').remove()
          
          // Pushes film attributes into the film form.
          var attributes = JSON.parse(data)
          $('#film_directors').val(attributes['directors'])
          $('#film_release_year').val(attributes['release_year'])
          $('#film_running_time').val(attributes['running_time'])
          $('#film_title').val(attributes['title'])
          $('#film_url').val(attributes['imdb_url'])
          $('#film_rating').focus()
        },
        error: function (exception) {
          // Show an error toast.
          default_toastr(
            'error',
            'Error: Could not get film data.',
            'Sorry about that. Try again?'
          )
        }
      })
    }
  })
})
