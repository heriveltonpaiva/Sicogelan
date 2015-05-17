package br.sicogelan.caixa



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class OpcaoCardapioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OpcaoCardapio.list(params), model:[opcaoCardapioInstanceCount: OpcaoCardapio.count()]
    }

    def show(OpcaoCardapio opcaoCardapioInstance) {
        respond opcaoCardapioInstance
    }

    def create() {
        respond new OpcaoCardapio(params)
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

        opcaoCardapioInstance.save flush:true

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
