import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["types", "roles"]

    update(event) {
        const eventType = event.target.value
        const roles = this.rolesTarget
        const roleOptions = Array.from(roles.options)
        const optionToFind = roleOptions.find(option => option.text === "Member")

        if (eventType === "closing" || eventType === "candlelight" || eventType === "sendoff") {
            optionToFind.selected = true
        } else {
            // resets form if necessary
            roles.selectedIndex = 0
        }
    }
}
