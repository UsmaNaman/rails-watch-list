import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Create lists", "Watch movies"],
      typeSpeed: 25,
      loop: true
    })
  }
}
