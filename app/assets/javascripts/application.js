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
//= require rails-ujs
//= require turbolinks
//= require_tree .
const highlightBlue = "#EDF6FD";
const blue = "#6E9AFF";
$(document).on('turbolinks:load', function() {
	let navBarItem = "#" + $(".title").text().toLowerCase();
	$(navBarItem).css("background", highlightBlue);
	$(navBarItem).css("color", blue);

	$(document).ready(function() {
		$(".resource-edit-button.edit").click(function() {
			let modal = $(this).parent().parent().parent().next();
			modal.fadeIn();
			modal.css("top", "50%");
			$(".overlay").fadeIn();
		})

		$(".overlay, .close").click(function() {
			$(".modal-form").css("top", "150%");
			setTimeout(function() {
				$(".modal-form, .overlay").fadeOut();
			}, 100)
		})
	})
})