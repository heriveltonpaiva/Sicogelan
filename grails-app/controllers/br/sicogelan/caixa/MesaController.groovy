package br.sicogelan.caixa



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class MesaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
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
                flash.message = message(code: 'default.created.message', args: [message(code: 'mesa.label', default: 'Mesa'), mesaInstance.id])
                redirect mesaInstance
            }
            '*' { respond mesaInstance, [status: CREATED] }
        }
    }

    def edit(Mesa mesaInstance) {
        respond mesaInstance
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Mesa.label', default: 'Mesa'), mesaInstance.id])
                redirect mesaInstance
            }
            '*'{ respond mesaInstance, [status: OK] }
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Mesa.label', default: 'Mesa'), mesaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
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
