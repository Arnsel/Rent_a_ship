import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mouse-cursor"
export default class extends Controller {
  connect() {
    let circle = document.getElementById('circle');
    const onMouseMove = (e) =>{
      circle.style.left = e.pageX + 'px';
      circle.style.top = e.pageY + 'px';
    }
    document.addEventListener('mousemove', onMouseMove);
  }
}
