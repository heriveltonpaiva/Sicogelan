package br.sicogelan.caixa



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class MesaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        respond Mesa.list(params), model:[mesaInstanceCount: Mesa.count()]
    }

    def show(Mesa mesaInstance) {
        respond mesaInstance
    }

    def create() {
        respond new Mesa(params)
    }

    @Transactional
    def save(Mesa mesaInstance) {
        if (mesaInstance == null) {
            notFound()
            return
        }

        if (mesaInstance.hasErrors()) {
            respond mesaInstance.errors, view:'create'
            return
        }

        mesaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
                // Exibir a mensagem de cadastro e continuar na memsa página
                redirect action:"index"
            }
            '*' { render  status: CREATED}
        }
    }

    def edit(Mesa mesaInstance) {
        respond(mesaInstance)
    }

    @Transactional
    def update(Mesa mesaInstance) {
        if (mesaInstance == null) {
            notFound()
            return
        }

        if (mesaInstance.hasErrors()) {
            respond mesaInstance.errors, view:'edit'
            return
        }

        mesaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = 'Registro Alterado com Sucesso.'
                redirect action:"index"
            }
            '*'{ render  status: OK}
        }
    }

    @Transactional
    def delete(Mesa mesaInstance) {

        if (mesaInstance == null) {
            notFound()
            return
        }

        mesaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = 'Registro Removido com Sucesso.'
                redirect action:"index"
            }
            '*'{  render mesaInstance, [status: OK] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mesa.label', default: 'Mesa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
