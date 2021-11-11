import consumer from 'channels/consumer'

document.addEventListener('turbo:load', () => {
    consumer.connection.reopen()
    consumer.subscriptions.create({ channel: "MatchingChannel" }, {
        received(data) {
            location.href = data;
        }
    })
})