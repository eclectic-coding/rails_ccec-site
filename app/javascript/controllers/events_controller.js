import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["types", "roles", "venue"]

    update(event) {
        const eventType = event.target.value
        const roles = this.rolesTarget
        const venue = this.venueTarget
        const roleOptions = Array.from(roles.options)
        const venueOptions = Array.from(venue.options)
        const optionToFind = roleOptions.find(option => option.text === "Member")
        const venueToFind = venueOptions.find(option => option.text === "Salt and Light Center")

        eventType === "weekend" ? venueToFind.selected = true : venue.selectedIndex = 0

        if (eventType === "closing" || eventType === "candlelight" || eventType === "sendoff") {
            optionToFind.selected = true
        } else {
            roles.selectedIndex = 0
        }
    }
}
