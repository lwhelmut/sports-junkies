import consumer from "./consumer"

// $(function()
document.addEventListener('turbolinks: load', () => {
  consumer.subscriptions.create({channel: "RoomChannel", room: $('#messages').data('room_id') }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      return $('#messages').append(data['message']);
    },

    speak: function(message) {
      return this.perform('speak', {message: message});
    }
  });
})