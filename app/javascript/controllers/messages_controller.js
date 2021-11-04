import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    scroll() {
        const e = document.getElementById("messageContainer");
        e.scrollTop = e.scrollHeight;
    }
}