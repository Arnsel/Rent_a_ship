import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
    connect() {
      new Typed(this.element, {
        strings: ["Get the perfect spaceship for your Intergalatic trip!"],
        typeSpeed: 65,
        loop: false,
        loopCount: 1,
    })
  }
}
