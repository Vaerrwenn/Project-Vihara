// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery_ujs
//= require datatables
//= require jquery3
//= require popper
//= require bootstrap-sprockets
import 'core-js/stable'
import 'regenerator-runtime/runtime'

var $  = require('jquery');
var dt = require('datatables.net')();

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jszip');
require('datatables.net-bs4')(window, $);
require('datatables.net-buttons-bs4')(window, $);
require('datatables.net-buttons/js/buttons.html5.js')(window, $);
require('datatables.net-fixedheader-bs4')(window, $);
require('datatables.net-responsive-bs4')(window, $);
require('datatables.net-searchpanes-bs4')(window, $);
require('datatables.net-select-bs4')(window, $);

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import "bootstrap";
import "../stylesheets/application";
import "./custom"
import "@fortawesome/fontawesome-free/js/all";
