package br.sicogelan.seguranca

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class PapelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Papel.list(params), model:[papelInstanceCount: Papel.count()]
    }

    def show(Papel papelInstance) {
        respond papelInstance
    }

    def create() {
        respond new Papel(params)
    }

    @Transactional
    def save(Papel papelInstance) {
        if (papelInstance == null) {
            notFound()
            return
        }

        if (papelInstance.hasErrors()) {
            respond papelInstance.errors, view:'create'
            return
        }

        papelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
                // Exibir a mensagem de cadastro e continuar na memsa página
                redirect action:"create"
            }
            '*' { render  status: CREATED}
        }
    }

    def edit(Papel papelInstance) {
        respond papelInstance
    }

    @Transactional
    def update(Papel papelInstance) {
        if (papelInstance == null) {
            notFound()
            return
        }

        if (papelInstance.hasErrors()) {
            respond papelInstance.errors, view:'edit'
            return
        }

        papelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Papel.label', default: 'Papel'), papelInstance.id])
                redirect papelInstance
            }
            '*'{ respond papelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Papel papelInstance) {

        if (papelInstance == null) {
            notFound()
            return
        }

        papelInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Papel.label', default: 'Papel'), papelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'papel.label', default: 'Papel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
