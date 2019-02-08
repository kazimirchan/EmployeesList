// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


function sendRequest(boss_id) {
    const Http = new XMLHttpRequest();
    const url='/employees/json/' + boss_id ;
    Http.open("GET", url);
    Http.setRequestHeader("Content-type", "application/json");
    Http.send();
    Http.onreadystatechange=(e)=>{
        console.log(Http.responseText)
    }
}
