<%@ page import="br.sicogelan.comum.Arquivo" %>


<div class="fieldcontain ${hasErrors(bean: arquivoInstance, field: 'nome', 'error')} required">
    <div class="form-group">
	    <label for="nome">
		    <g:message  code="arquivo.nome.label" default="Nome"  />
		    <span class="required-indicator">*</span>
	    </label>
	        <g:textField class="form-control" name="nome" required="" value="${arquivoInstance?.nome}"/>
   </div>
</div>

<div class="fieldcontain ${hasErrors(bean: arquivoInstance, field: 'contentType', 'error')} required">
    <div class="form-group">
	    <label for="contentType">
		    <g:message code="arquivo.contentType.label" default="Content Type" />
		    <span class="required-indicator">*</span>
	    </label>
	        <g:textField class="form-control" name="contentType" required="" value="${arquivoInstance?.contentType}"/>
    </div>
</div>

<div class="fieldcontain ${hasErrors(bean: arquivoInstance, field: 'arquivo', 'error')} required">
    <div class="form-group">
	    <label for="arquivo">
		    <g:message code="arquivo.arquivo.label" default="Arquivo" />
		    <span class="required-indicator">*</span>
	    </label>
	        <input type="file" id="arquivo" name="arquivo" />
    </div>
</div>

