import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  open() {
    let popper = document.getElementById("popper");
    let menu = document.getElementById("menu");
    let arrow = document.getElementById("arrow");

    const toggleMenu = () => {
      menu.classList.toggle('active');
      arrow.classList.toggle('active')
    }

    popper.addEventListener('click', e => {
      e.stopPropagation();

      toggleMenu();
    });

    document.addEventListener('click', e => {
      let target = e.target;
      let its_menu = target == menu || menu.contains(target);
      let its_popper= target == popper;
      let menu_is_active = menu.classList.contains('active');

      if (!its_menu && !its_popper && menu_is_active) {
        toggleMenu();
      }
    })
  }
}
