package br.sicogelan.comum



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class RegistroGeralController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        respond RegistroGeral.list(params), model:[registroGeralInstanceCount: RegistroGeral.count()]
    }

    def show(RegistroGeral registroGeralInstance) {
        respond registroGeralInstance
    }

    def create() {
        respond new RegistroGeral(params)
    }

    @Transactional
    def save(RegistroGeral registroGeralInstance) {
        if (registroGeralInstance == null) {
            notFound()
            return
        }

        if (registroGeralInstance.hasErrors()) {
            respond registroGeralInstance.errors, view:'create'
            return
        }
        registroGeralInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
                // Exibir a mensagem de cadastro e continuar na memsa página
                redirect action:"create"
            }
            '*' { render  status: CREATED}
        }
    }

    def edit(RegistroGeral registroGeralInstance) {
        respond registroGeralInstance
    }

    @Transactional
    def update(RegistroGeral registroGeralInstance) {
        if (registroGeralInstance == null) {
            notFound()
            return
        }

        if (registroGeralInstance.hasErrors()) {
            respond registroGeralInstance.errors, view:'edit'
            return
        }

        registroGeralInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RegistroGeral.label', default: 'RegistroGeral'), registroGeralInstance.id])
                redirect registroGeralInstance
            }
            '*'{ respond registroGeralInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RegistroGeral registroGeralInstance) {

        if (registroGeralInstance == null) {
            notFound()
            return
        }

        registroGeralInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RegistroGeral.label', default: 'RegistroGeral'), registroGeralInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registroGeral.label', default: 'RegistroGeral'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
