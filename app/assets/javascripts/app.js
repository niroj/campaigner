$(document).ready(function(){
  $('.selectized-input').selectize({
    delimiter: ',',
    persist: false,
    create: function(input) {
        return {
            value: input,
            text: input
        }
    }
  });
});
