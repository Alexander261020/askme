require("@rails/ujs").start()
require("@rails/activestorage").start()
require("jquery")

global.$ = require("jquery")

import "../styles/application.scss"
const images = require.context('../images', true)
import * as ActiveStorage from "@rails/activestorage"

ActiveStorage.start()

$(function(){
  $('#ask-button').click(function(){
    $('#ask-form').slideToggle(300);
    return false;
  });
});
