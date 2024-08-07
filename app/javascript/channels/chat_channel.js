// import consumer from "channels/consumer"

// consumer.subscriptions.create("ChatChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });


import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const chatElement = document.getElementById('chat-id')
  if (chatElement) {
    const chatId = chatElement.getAttribute('data-chat-id')

    consumer.subscriptions.create({ channel: "ChatChannel", chat_id: chatId }, {
      received(data) {
        const messagesContainer = document.getElementById('messages')
        messagesContainer.innerHTML += data.message
      }
    })
  }
})
