import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["types", "roles", "venue"]

    connect() {
        console.log("Map Controller Connected")
    }
}
