import { Controller } from "@hotwired/stimulus"
import { FetchRequest, patch } from "@rails/request.js"

export default class extends Controller {
    static values = { url: String }

    connect() {
        console.log("Activation controller connected again n")
    }

    async toggle(event) {
        event.preventDefault()
        console.log("Toggle button clicked", this.urlValue)

        const request = new FetchRequest("patch", this.urlValue, {responseKind: "turbo-stream"})
        const response = await request.perform()
        if (response.ok) {
            console.log("Request succeeded")
        }
    }
}
