$( document ).ready(function() {
  Shiny.addCustomMessageHandler('fun', function(arg) {
  
  })
});



$(function() {
  
  $(document).on({
    'shiny:inputchanged': function(event) {
      switch (event.name) {
        case 'siderbarCollapsed':
          alert('Sorry, the current process has been prevented.');
        default:
      }
    }
  })

  
})