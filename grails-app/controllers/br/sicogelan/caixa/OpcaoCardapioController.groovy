package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured('isAuthenticated()')
class OpcaoCardapioController {

    static allowedMethods = [index: "GET", save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        respond OpcaoCardapio.list(params), model:[opcaoCardapioInstanceCount: OpcaoCardapio.count()]
    }

    def show(OpcaoCardapio opcaoCardapioInstance) {
        respond opcaoCardapioInstance
    }

    def create() {
        respond new OpcaoCardapio(params)
    }
    /**
     * Mostrar as informações do cardapio via AJAX após selecionar o ComboBox
     * @return
     */
    def cardapioById() {
        respond Cardapio.findById(request.getParameter("idCardapio")), view:'infoCardapio'
    }
    /**
     * Mostra as informações da categoria da opção do cardápio via AJAX após selecionar o ComboBox
     * @return
     */
    def categoriaOpcaoById(){
        respond CategoriaOpcaoCardapio.findById(request.getParameter("idCategoriaOpcao")), view:'infoCategoriaOpcao'
    }

    @Transactional
    def save(OpcaoCardapio opcaoCardapioInstance) {
        if (opcaoCardapioInstance == null) {
            notFound()
            return
        }

        if (opcaoCardapioInstance.hasErrors()) {
            respond opcaoCardapioInstance.errors, view:'create'
            return
        }

        def arquivoEnvio = request.getFile("arquivoEnvio")
        if(!arquivoEnvio.empty){
            def arquivo = new Arquivo(nome: arquivoEnvio.originalFilename, contentType: arquivoEnvio.contentType, arquivo:arquivoEnvio.getBytes())
            opcaoCardapioInstance.arquivo = arquivo.save(flush:true)
            opcaoCardapioInstance.save flush:true
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

    def edit(OpcaoCardapio opcaoCardapioInstance) {
        respond opcaoCardapioInstance
    }

    @Transactional
    def update(OpcaoCardapio opcaoCardapioInstance) {
        if (opcaoCardapioInstance == null) {
            notFound()
            return
        }

        if (opcaoCardapioInstance.hasErrors()) {
            respond opcaoCardapioInstance.errors, view:'edit'
            return
        }

        opcaoCardapioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OpcaoCardapio.label', default: 'OpcaoCardapio'), opcaoCardapioInstance.id])
                redirect opcaoCardapioInstance
            }
            '*'{ respond opcaoCardapioInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(OpcaoCardapio opcaoCardapioInstance) {

        if (opcaoCardapioInstance == null) {
            notFound()
            return
        }

        opcaoCardapioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OpcaoCardapio.label', default: 'OpcaoCardapio'), opcaoCardapioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcaoCardapio.label', default: 'OpcaoCardapio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
