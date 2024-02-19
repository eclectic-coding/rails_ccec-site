import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["types", "roles", "venue"]
    static values = {
        latitude: Number,
        longitude: Number,
    }

    connect() {
        if (typeof(google) != "undefined") {
            this.initMap()
        }
    }

    async initMap() {
        const { Map } = await google.maps.importLibrary("maps");
        const { AdvancedMarkerElement } = await google.maps.importLibrary("marker")

        this.map = new Map(this.element, {
            center: { lat: this.latitudeValue, lng: this.longitudeValue },
            zoom: this.latitudeValue == null ? 4 : 15,
            disableDefaultUI: true,
            mapId: "DEMO_MAP_ID",
        });

        this.marker = new AdvancedMarkerElement({
            map: this.map,
            position: { lat: this.latitudeValue, lng: this.longitudeValue },
        });
    }
}
