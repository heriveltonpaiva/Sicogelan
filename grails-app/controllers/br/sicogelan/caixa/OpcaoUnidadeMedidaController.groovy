package br.sicogelan.caixa



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured('isAuthenticated()')
class OpcaoUnidadeMedidaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        respond OpcaoUnidadeMedida.list(params), model:[opcaoUnidadeMedidaInstanceCount: OpcaoUnidadeMedida.count()]
    }

    def show(OpcaoUnidadeMedida opcaoUnidadeMedidaInstance) {
        respond opcaoUnidadeMedidaInstance
    }

    def create() {
        respond new OpcaoUnidadeMedida(params)
    }

    @Transactional
    def save(OpcaoUnidadeMedida opcaoUnidadeMedidaInstance) {
        if (opcaoUnidadeMedidaInstance == null) {
            notFound()
            return
        }

        if (opcaoUnidadeMedidaInstance.hasErrors()) {
            respond opcaoUnidadeMedidaInstance.errors, view:'create'
            return
        }

        opcaoUnidadeMedidaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
                // Exibir a mensagem de cadastro e continuar na memsa página
                redirect action:"create"
            }
            '*' { render  status: CREATED}
        }
    }

    def edit(OpcaoUnidadeMedida opcaoUnidadeMedidaInstance) {
        respond opcaoUnidadeMedidaInstance
    }

    @Transactional
    def update(OpcaoUnidadeMedida opcaoUnidadeMedidaInstance) {
        if (opcaoUnidadeMedidaInstance == null) {
            notFound()
            return
        }

        if (opcaoUnidadeMedidaInstance.hasErrors()) {
            respond opcaoUnidadeMedidaInstance.errors, view:'edit'
            return
        }

        opcaoUnidadeMedidaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OpcaoUnidadeMedida.label', default: 'OpcaoUnidadeMedida'), opcaoUnidadeMedidaInstance.id])
                redirect opcaoUnidadeMedidaInstance
            }
            '*'{ respond opcaoUnidadeMedidaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OpcaoUnidadeMedida opcaoUnidadeMedidaInstance) {

        if (opcaoUnidadeMedidaInstance == null) {
            notFound()
            return
        }

        opcaoUnidadeMedidaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OpcaoUnidadeMedida.label', default: 'OpcaoUnidadeMedida'), opcaoUnidadeMedidaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcaoUnidadeMedida.label', default: 'OpcaoUnidadeMedida'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
