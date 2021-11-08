import consumer from 'channels/consumer'

consumer.subscriptions.create({ channel: "MatchingChannel" }, {
    received(data) {
        location.href = data;
    }
})
