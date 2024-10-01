// Turbo ya maneja las solicitudes delete con data-turbo-method="delete"
// No es necesario crear formularios manualmente para manejar delete

  
  // Script para ocultar automáticamente los mensajes flash
  function hideFlashMessages() {
    setTimeout(function() {
      var flashMessages = document.getElementById('flash-messages');
      if (flashMessages) {
        flashMessages.style.display = 'none';
      }
    }, 4000); // Tiempo para ocultar los mensajes (3 segundos)
  }
  
  // Ejecutar la función cuando la página se carga por primera vez y después de redirecciones con Turbo
  document.addEventListener("turbo:load", hideFlashMessages);
  document.addEventListener("DOMContentLoaded", hideFlashMessages);
  
  // Turbo configurado
  import { Turbo } from "@hotwired/turbo-rails"
  Turbo.session.drive = true;
  