import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "button"]

  toggle() {
    this.inputType()
    this.buttonText()
  }

  inputType() {
    this.inputTargets.forEach(target => {
      target.type = target.type === 'password' ? 'text' : 'password'
    })
  }

  buttonText() {
    const svg = this.buttonTarget.querySelector('svg')
    const classes = svg.classList;
    this.inputTarget.type === 'password' ? classes.toggle('fa-eye') : classes.toggle('fa-eye-slash')
  }
}
