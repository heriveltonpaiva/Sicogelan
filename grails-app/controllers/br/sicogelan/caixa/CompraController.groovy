package br.sicogelan.caixa



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured('isAuthenticated()')
class CompraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        respond Compra.list(params), model:[compraInstanceCount: Compra.count()]
    }

    def show(Compra compraInstance) {
        respond compraInstance
    }

    def create() {
        respond new Compra(params)
    }

    @Transactional
    def save(Compra compraInstance) {
        if (compraInstance == null) {
            notFound()
            return
        }

        if (compraInstance.hasErrors()) {
            respond compraInstance.errors, view:'create'
            return
        }

        compraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
                // Exibir a mensagem de cadastro e continuar na memsa página
                redirect action:"create"
            }
            '*' { render  status: CREATED}
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Compra compraInstance) {
        respond compraInstance
    }

    @Transactional
    def update(Compra compraInstance) {
        if (compraInstance == null) {
            notFound()
            return
        }

        if (compraInstance.hasErrors()) {
            respond compraInstance.errors, view:'edit'
            return
        }

        compraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Compra.label', default: 'Compra'), compraInstance.id])
                redirect compraInstance
            }
            '*'{ respond compraInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(Compra compraInstance) {

        if (compraInstance == null) {
            notFound()
            return
        }

        compraInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Compra.label', default: 'Compra'), compraInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
