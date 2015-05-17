package br.sicogelan.caixa



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class OpcaoIngredienteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OpcaoIngrediente.list(params), model:[opcaoIngredienteInstanceCount: OpcaoIngrediente.count()]
    }

    def show(OpcaoIngrediente opcaoIngredienteInstance) {
        respond opcaoIngredienteInstance
    }

    def create() {
        respond new OpcaoIngrediente(params)
    }

    @Transactional
    def save(OpcaoIngrediente opcaoIngredienteInstance) {
        if (opcaoIngredienteInstance == null) {
            notFound()
            return
        }

        if (opcaoIngredienteInstance.hasErrors()) {
            respond opcaoIngredienteInstance.errors, view:'create'
            return
        }

        opcaoIngredienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
                // Exibir a mensagem de cadastro e continuar na memsa página
                redirect action:"create"
            }
            '*' { render  status: CREATED}
        }
    }

    def edit(OpcaoIngrediente opcaoIngredienteInstance) {
        respond opcaoIngredienteInstance
    }

    @Transactional
    def update(OpcaoIngrediente opcaoIngredienteInstance) {
        if (opcaoIngredienteInstance == null) {
            notFound()
            return
        }

        if (opcaoIngredienteInstance.hasErrors()) {
            respond opcaoIngredienteInstance.errors, view:'edit'
            return
        }

        opcaoIngredienteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OpcaoIngrediente.label', default: 'OpcaoIngrediente'), opcaoIngredienteInstance.id])
                redirect opcaoIngredienteInstance
            }
            '*'{ respond opcaoIngredienteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OpcaoIngrediente opcaoIngredienteInstance) {

        if (opcaoIngredienteInstance == null) {
            notFound()
            return
        }

        opcaoIngredienteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OpcaoIngrediente.label', default: 'OpcaoIngrediente'), opcaoIngredienteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'opcaoIngrediente.label', default: 'OpcaoIngrediente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
