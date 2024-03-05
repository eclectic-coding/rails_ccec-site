import { application } from "./application"

// Load third party controllers
import Flatpickr from "stimulus-flatpickr"
application.register('flatpickr', Flatpickr)

import Notification from "stimulus-notification"
application.register('notification', Notification)