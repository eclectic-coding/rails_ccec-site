import { Application } from "@hotwired/stimulus"
import "./third_party_controllers"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
