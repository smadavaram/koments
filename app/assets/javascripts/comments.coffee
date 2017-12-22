# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.comment-reply').click ->
    $(this).closest('.comment').find('.reply-form').toggle()
    return


  # Read and convert numeric rating to Stars (on views/reviews/_review):
$( document ).on 'turbolinks:load', ->
  $( '.star-rating' ).raty
    path: '/assets'
    readOnly: true
    score: ->
      $( this ).attr( 'data-score' )
  # reload to remove ghost stars on browser back tracing:
  $( '.star-rating' ).raty( 'reload' )

# Read and convert numeric rating to Stars, set Star rating (on views/reviews/_form):
$( document ).on 'turbolinks:load', ->
  $( '#star-rating' ).raty
    path: '/assets'
    scoreName: 'comment[rating]'
    score: ->
      $( this ).attr( 'data-score' )
  $( '#star-rating' ).raty( 'reload' )
