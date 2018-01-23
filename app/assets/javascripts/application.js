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
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require_tree .
var d;
var q;
var pi = [];

function dChange(val) {
    if (!isNaN(val)) {
        d = val;
        pi = [];
        for (var i = 1; i <= d; i++) {
            pi.push({ 'mi' : '', 'li' : ''});
        }
    }
    $.ajax({
        url: "/home/param_change",
        type: "POST",
        data: { 
            d: d,
            q: q
        }
    });
}

function qChange(val){
    if (!isNaN(val)) {
        q = val;
    }
    $.ajax({
        url: "/home/param_change",
        type: "POST",
        data: { 
            d: d,
            q: q
        }
    });
}

function piChange(val) {
    if (!isNaN(val)) {
        var changedCoordinate = event.target.id;
        var tree = parseInt(changedCoordinate.substring(changedCoordinate.lastIndexOf('_') + 1));
        var coord = changedCoordinate[0];
        pi[tree - 1][coord + 'i'] = val; //we are 0 index but trees are 1 index
    }
    $.ajax({
        url: "/home/projection_change",
        type: "POST",
        data: { 
            pi: pi
        }
    });
}
