import consumer from './consumer'

consumer.subscriptions.create({ channel: "MatchingChannel" }, {
    received(data) {
        location.href = data;
    }
})
