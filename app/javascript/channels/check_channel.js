import consumer from "./consumer"

consumer.subscriptions.create("CheckChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const div = document.createElement("div");
    div.setAttribute("id", data['order'].id);
    div.innerHTML = data['render']
    const parent = document.getElementById(`container${data['order'].id}`);
    const elem = document.getElementById(data['order'].id);
    parent.replaceChild(div, elem);
  }
});