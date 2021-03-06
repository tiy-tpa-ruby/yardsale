// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('.media-heading').on('click', function(event) {
    $(this).css({color: 'orange'})
  })


  $('#query').on('input', function(event) {
    let queryValue = $(this).val()

    console.log(`You are searching for ${queryValue}`)

    $.ajax({
      url: '/items',
      data: { query: queryValue },
      dataType: 'script'
    })
  })

  $('.item-description').on('click', function(event) {
    let description = $(this).data('descriptiontext')

    console.log(`Clicked on an item with a description of ${description}`)
  })
})
