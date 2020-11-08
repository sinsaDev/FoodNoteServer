import consumer from "./consumer"

consumer.subscriptions.create({channel: "CommentChannel"}, {
  connected() {
    console.log("connected cable")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    console.log("rejected")
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("received")
    console.log(data)
    // Called when there's incoming data on the websocket for this channel
  }
})
