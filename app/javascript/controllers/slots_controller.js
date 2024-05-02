import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="slots"
export default class extends Controller {
    static targets = ["days", "times"]
    static values = { url: String }

    connect() {
        console.log("URL Value: ", this.urlValue) // Debug print statement
        this.daysTarget.firstChild.selected = true
    }

    updateSelect(event) {
        let params = new URLSearchParams()
        params.append("date", this.daysTarget.value)

        console.log(`${this.urlValue}?${params}`)

        get(`${this.urlValue}?${params}`, {
            responseKind: "turbo-stream"
        }).then(response => console.log(response))
    }
}
