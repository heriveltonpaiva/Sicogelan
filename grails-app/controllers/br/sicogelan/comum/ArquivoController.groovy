package br.sicogelan.comum

import br.sicogelan.caixa.Cardapio
import grails.converters.JSON
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * Link do Tutorial Arquivo
 * https://grailsinaction.wordpress.com/2013/05/28/simplest-imagefile-grails-crud-using-a-data-base-as-a-storage/
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class ArquivoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

     def indexTab = 0

    def index(Integer max) {
        def indexTab = 1
        params.max = Math.min(max ?: 5, 100)

        respond(Arquivo.list(params), model:[arquivoInstanceCount: Arquivo.count()])
    }

    def show(Arquivo arquivoInstance) {
        def indexTab = 1
        new Arquivo(params)
        redirect action: "create"
    }

    def create(Integer max) {
        indexTab = 0

    }
    def showImagem() {
        def fileInstance = Arquivo.get(params.id)
        response.outputStream.write(fileInstance.getArquivo())
        response.outputStream.flush()
    }

    @Transactional
    def save(Arquivo arquivoInstance) {
        if (arquivoInstance == null) {
            notFound()
            return
        }

        if (arquivoInstance.hasErrors()) {
            respond arquivoInstance.errors, view:'create'
            return
        }

        arquivoInstance.save flush:true
        indexTab=1
        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
                //ADICIONAR ESSA LINHA
                redirect action:"create"
            }
            //RETORNAR PARA PRÓPRIA TELA
            //ADICIONAR ESSA NO SCAFFOLD
            '*' { render  status: CREATED}
        }
    }

    def edit(Arquivo arquivoInstance) {
        indexTab=0
        respond(arquivoInstance, view: 'create')
    }

    @Transactional
    def update(Arquivo arquivoInstance) {
        if (arquivoInstance == null) {
            notFound()
            return
        }

        if (arquivoInstance.hasErrors()) {
            respond arquivoInstance.errors, view:'edit'
            return
        }

        arquivoInstance.save flush:true
        indexTab=1
        request.withFormat {
            form multipartForm {
                flash.message = 'Registro Alterado com Sucesso.'
                redirect action:"create"
            }
            '*'{ render  status: OK}
        }
    }

    @Transactional
    def delete(Arquivo arquivoInstance) {

        if (arquivoInstance == null) {
            notFound()
            return
        }

        arquivoInstance.delete flush:true
        indexTab=1
        request.withFormat {
            form multipartForm {
                flash.message = 'Registro Removido com Sucesso.'
                redirect action:"create"
            }
            '*'{  render arquivoInstance, [status: OK] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'arquivo.label', default: 'Arquivo'), params.id])
                redirect action:"create"
            }
            '*'{  respond arquivoInstance, [status: NOT_FOUND]}
        }
    }
    /**  Lista de Arquivos Json **/

    def listJson(Integer max){
        params.max = Math.min(max ?: 20, 100)
        render Arquivo.list(params) as JSON
    }


}
