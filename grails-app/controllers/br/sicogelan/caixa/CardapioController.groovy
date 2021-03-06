package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo
import br.sicogelan.comum.ArquivoController

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured('isAuthenticated()')
class CardapioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cardapio.list(params), model:[cardapioInstanceCount: Cardapio.count()]
    }

    def show(Cardapio cardapioInstance) {
        respond cardapioInstance
    }

    def create() {
        respond new Cardapio(params)
    }

    @Transactional
    def save(Cardapio cardapioInstance) {
        if (cardapioInstance == null) {
            notFound()
            return
        }


        if (cardapioInstance.hasErrors()) {
            respond cardapioInstance.errors, view:'create'
            return
        }

        def arquivoEnvio = request.getFile("arquivoEnvio")
        if(!arquivoEnvio.empty){
            def arquivo = new Arquivo(nome: arquivoEnvio.originalFilename, contentType: arquivoEnvio.contentType, arquivo:arquivoEnvio.getBytes())
            cardapioInstance.arquivo = arquivo.save(flush:true)
            cardapioInstance.save flush:true
        }

        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
            // Exibir a mensagem de cadastro e continuar na memsa página
                redirect action:"create"
            }
            '*' { render  status: CREATED}
        }
    }

    def edit(Cardapio cardapioInstance) {
        respond cardapioInstance
    }

    @Transactional
    def update(Cardapio cardapioInstance) {
        if (cardapioInstance == null) {
            notFound()
            return
        }

        if (cardapioInstance.hasErrors()) {
            respond cardapioInstance.errors, view:'edit'
            return
        }

        cardapioInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cardapio.label', default: 'Cardapio'), cardapioInstance.id])
                redirect cardapioInstance
            }
            '*'{ respond cardapioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cardapio cardapioInstance) {

        if (cardapioInstance == null) {
            notFound()
            return
        }

        cardapioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cardapio.label', default: 'Cardapio'), cardapioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cardapio.label', default: 'Cardapio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
