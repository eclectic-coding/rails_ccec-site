import { Controller } from "@hotwired/stimulus";
import * as bootstrap from "bootstrap";

export default class extends Controller {
    initialize() {
        console.log("toast controller initialized");
    }

    connect() {
        new bootstrap.Toast(this.element).show();
    }
}
