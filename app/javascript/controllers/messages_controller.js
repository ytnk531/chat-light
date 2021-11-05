import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["messages", "message"]

    connect() {
        this.scroll()
    }
    messageTargetConnected() {
        this.scroll()
    }
    scroll() {
        const e = this.messagesTarget;
        e.scrollTop = e.scrollHeight;
    }
}