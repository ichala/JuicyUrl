import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ['form'];
  static custom= document.querySelector('#custom');
  static alias= document.querySelector('#alias');
  static aliasHelp= document.querySelector('#aliasHelp');

  connect() {
    
    const custom= document.querySelector('#custom');
    
    custom.addEventListener('click', () => {
      if (custom.checked) {
        alias.disabled = false;
        aliasHelp.classList.remove('d-none');
       }else{
        alias.disabled = true;
        alias.classList.remove('is-invalid');
        aliasHelp.classList.add('d-none');
       }
    });
   
  }

  submitForm(e) {
    let data= this.formTarget;
    let url = data.url.value;
    if (url.length === 0 ) {
      data.url.classList.add('is-invalid');
      e.preventDefault();
    }else{
      if (custom.checked) {
        if (alias.value  == 0 || alias.value > 16) {
          alias.classList.add('is-invalid');
          e.preventDefault();
        }
      }
    }
  }
  
}
