import { Controller } from '@hotwired/stimulus'

// Connects to data-controller='validates'
export default class extends Controller {

  static targets = ['input', 'form']

  static classes = ['success', 'danger']

  submit() {
    if (this.hasFormTarget) {
      this.formTargets.forEach(form => {
        const input = form.querySelector('input');
        const hint = form.querySelector('label');
        this.pattern(input, hint)
        this.required(input, hint)
        this.whitespaces(input, hint)
      });
    }
    this.passwordConfirmation()
  }

  // check if the input pattern is valid and update the hint
  pattern(input, hint) {
    if (!input.checkValidity()) {
      hint.textContent = `Enter a valid ${input.title}`
      this.invalid(hint)
    }
    if (input.checkValidity()) {
      hint.textContent = `Looks good!`
      this.valid(hint)
    }
  }

  required(input, hint) {
    if (input.required && input.value.trim() === '') {
      hint.textContent = 'This field is required'
      this.invalid(hint)
    }
  }

  whitespaces(input, hint) {
    if (/\s/.test(input.value)) {
      hint.textContent = 'Whitespaces not allowed'
      input.setCustomValidity('invalid')
      this.invalid(hint)
    }
  }

  passwordConfirmation() {
    if (this.hasInputTarget) {

      const password = this.inputTargets[0]
      const confirmation = this.inputTargets[1]
      const hint = document.getElementById('confirmation-hint')

      if (password.value !== confirmation.value) {
        hint.textContent = "Passwords don't match"
        confirmation.setCustomValidity('invalid');
        this.invalid(hint)
        return
      }

      confirmation.setCustomValidity('');

      if (password.value === confirmation.value && password.value.trim() !== '' && confirmation.checkValidity()) {
        hint.textContent = 'Passwords match'
        this.valid(hint)
      }
    }
  }

  invalid(hint) {
    hint.classList.add(this.dangerClass)
    hint.classList.remove(this.successClass)
  }

  valid(hint) {
    hint.classList.remove(this.dangerClass)
    hint.classList.add(this.successClass)
  }

}
