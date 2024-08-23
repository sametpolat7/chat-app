import consumer from "./consumer"

document.addEventListener('turbo:load', () => {
  const messageContainer = document.getElementById('message-container');
  const textField = document.getElementById('text-field');

  if (!messageContainer || !textField) {
    return;
  }

  const currentUserEmail = document.getElementById('current_user_email').value;

  function scrollToBottom() {
    if (messageContainer) {
      messageContainer.scrollTop = messageContainer.scrollHeight;
    }
  }

  const chatRoomId = messageContainer.dataset.chatRoomId;
  if (chatRoomId) {
    consumer.subscriptions.create({ channel: "ChatRoomChannel", id: chatRoomId }, {
      received(data) {

        const isCurrentUser = data.user_email === currentUserEmail;

        const messageElement = document.createElement('div');
        messageElement.classList.add("p-4", isCurrentUser ? 'text-right' : 'text-left');
        messageElement.innerHTML = `
          <p class="font-bold text-xs">${data.username}</p>
          <p class="text-xs text-gray">Now</p>
          <p class="text-xl p-2 text-black">${data.content}</p>
        `;

        messageContainer.appendChild(messageElement);

        if (textField) {
          textField.value = '';
        }

        scrollToBottom();
      }
    });

    scrollToBottom();
  }
});
