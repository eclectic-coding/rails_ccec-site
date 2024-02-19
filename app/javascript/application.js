// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

console.log("Hello from application.js")

import "@hotwired/turbo-rails"
import LocalTime from "local-time"
LocalTime.start()
require("@rails/activestorage").start()
import "flowbite/dist/flowbite.turbo.js";

// import '../channels/**/*_channel.js'
import "./controllers"

