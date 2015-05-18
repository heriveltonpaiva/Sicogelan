<%--
  Created by IntelliJ IDEA.
  User: Herivelton
  Date: 18/05/2015
  Time: 00:09
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<h2>Olá</h2>
<p id="textoJson">

</p>
        <table class="table table-striped" id="tblAgenda">
    	    <thead>
	            			<tr>
    	            			<th>Nome</th>
    	            			<th>Contenty Type</th>
    	            			<th>&nbsp;</th>
    	            		</tr>
	        </thead>
                <tbody>
	           </tbody>
        </table>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    $( document ).ready(function() {
    $.get('http://localhost:8080/Sicogelan/arquivo.json',function(retorno){
                 console.log(retorno);
                $("#tblAgenda tbody").html("");
                			$.each(retorno,function(idx,agenda){
                    				var html = "<tr data-id=\""+agenda.id+"\">";
                    				html += "<td>"+agenda.nome+"</td>";
                        			html += "<td>"+agenda.contentType+"</td>";
                                    html += "<td>&nbsp;</td>";
                    				html += "</tr>";
                    				$("#tblAgenda tbody").append(html);
                    			});
                             },
            "json"
    );});

</script>

</html>