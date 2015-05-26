// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self


$(document).ready(function() {
	$("form[data-id]").submit(function (e) {
		e.preventDefault();
		alert("submeteu...");
		var dados = $(this).serializeArray();
		var url = $(this).data("url");
		console.log("url = " + url);
		console.log(dados);
		$.ajax({
			url: url,
			method: "POST",
			data: dados,
			dataType: "json",
			success: function (retorno) {
				console.log("retorno");
				console.log(JSON.stringify(retorno));
					var html = "<tr data-id=\"" + retorno.id + "\">";
					html += "<td>" + retorno.item.opcaoUnidadeMedida.id + "</td>";
				html += "<td>" + retorno.descricao + "</td>";
				//html += "<td>" + retorno.item.cardapio.id + "</td>";
				html += "<td>" + retorno.item.pedido + "</td>";
				html += "<td>" + retorno.item.quantidade + "</td>";
					html += "</tr>";
					$("#ajaxRetorno").append(html);
			}
		});
	});
});


if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}
