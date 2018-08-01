App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('connected')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('disconnected')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('received data:', data)
    message = '<div class="message">' +
        '<div class="message-user">' + data.username + ":" + '</div>' +
        '<div class="message-content">' + data.content + '</div>' + '</div>'

    unless data.content.blank?
      $('#messages-table').append(message)



submit_message = () ->
  $('#message_content').on('keydown', (e) ->
    e.preventDefault()

    if e.keyCode is 13
      $('input').click()
      e.target.value = ''
  )

$(document).on('turbolinks:load', () ->
  submit_message()
)