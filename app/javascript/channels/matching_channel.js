import consumer from './consumer'

consumer.subscriptions.create({ channel: "MatchingChannel", id: "id"}, {
    received(data) {
        alert(data);
    }
})
