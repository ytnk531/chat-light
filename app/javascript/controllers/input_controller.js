import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["message"]

    clear() {
        this.messageTarget.value = ""
    }
}