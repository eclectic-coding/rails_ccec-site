import { application } from "./application"
import controllers from './**/*_controller.js'
controllers.forEach((controller) => {
  application.register(controller.name, controller.module.default)
})

// Load third party controllers
import Flatpickr from "stimulus-flatpickr"
application.register('flatpickr', Flatpickr)