import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    let modal = document.getElementById("myModal");
    let span = document.getElementsByClassName("close")[0];

    modal.style.display = "block";

    span.onclick = function() {
      window.location.href = window.location.pathname.replace(/[0-9]/g, '')
    }

    window.onclick = function(event) {
      if (event.target == modal) {
        window.location.href = window.location.pathname.replace(/[0-9]/g, '')
      }
    }
  }

  copy() {
    let modal = document.getElementById("server-ip");
    let copeMessage = document.getElementById("cope-message");
    let timeOutFunc

    navigator.clipboard.writeText( modal.innerHTML);
    copeMessage.style.display = "flex"

    clearTimeout(timeOutFunc);
    timeOutFunc = setTimeout(function() { copeMessage.style.display = "none" } , 2500);
  }
}
