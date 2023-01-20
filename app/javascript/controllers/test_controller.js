import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    name: String,
  }

  opp() {
    console.log(this.nameValue)
  }
}
