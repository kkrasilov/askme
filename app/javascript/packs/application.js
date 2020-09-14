// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

import './jquery.tagcloud'

document.addEventListener("turbolinks:load", function () {
  $(function () {
    $('#ask-button').click(function () {
      $('#ask-form').slideToggle(300);
      return false;
    });
  });

  // Облако тэгов
  $('#tags a').tagcloud({
    size: { start: 12, end: 30, unit: 'pt' },
    color: { start: '#aaa', end: '#37474F' }
  });
});
