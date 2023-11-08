import { Controller } from "@hotwired/stimulus";
import * as bootstrap from "bootstrap";

export default class extends Controller {
    static targets = ["activated"];

    toggleDropdown(event) {
        let toggleMenu = this.activatedTarget
        let dropdownEl = new bootstrap.Dropdown(toggleMenu);

        if (event.type === 'mouseenter') {
            dropdownEl.show();
        } else {
            dropdownEl.hide();
        }
    }
}
