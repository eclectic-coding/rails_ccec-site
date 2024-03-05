// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "@hotwired/turbo-rails"
import LocalTime from "local-time"
LocalTime.start()
require("@rails/activestorage").start()
import "flowbite/dist/flowbite.turbo.js";

import '../channels/**/*_channel.js'
import "./controllers"
import "./controllers/third_party_controllers"

window.initMap = function(...args) {
    const event = document.createEvent("Events")
    event.initEvent("google-maps-callback", true, true)
    event.args = args
    window.dispatchEvent(event)
}

