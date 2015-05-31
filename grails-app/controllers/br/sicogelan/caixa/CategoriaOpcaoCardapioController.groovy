package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured('isAuthenticated()')
class CategoriaOpcaoCardapioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        respond CategoriaOpcaoCardapio.list(params), model:[categoriaOpcaoCardapioInstanceCount: CategoriaOpcaoCardapio.count()]
    }

    def show(CategoriaOpcaoCardapio categoriaOpcaoCardapioInstance) {
        respond categoriaOpcaoCardapioInstance
    }

    def create() {
        respond new CategoriaOpcaoCardapio(params)
    }

    @Transactional
    def save(CategoriaOpcaoCardapio categoriaOpcaoCardapioInstance) {
        if (categoriaOpcaoCardapioInstance == null) {
            notFound()
            return
        }

        if (categoriaOpcaoCardapioInstance.hasErrors()) {
            respond categoriaOpcaoCardapioInstance.errors, view:'create'
            return
        }

        def arquivoEnvio = request.getFile("arquivoEnvio")
        if(!arquivoEnvio.empty){
            def arquivo = new Arquivo(nome: arquivoEnvio.originalFilename, contentType: arquivoEnvio.contentType, arquivo:arquivoEnvio.getBytes())
            categoriaOpcaoCardapioInstance.arquivo = arquivo.save(flush:true)
            categoriaOpcaoCardapioInstance.save flush:true
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

    def edit(CategoriaOpcaoCardapio categoriaOpcaoCardapioInstance) {
        respond categoriaOpcaoCardapioInstance
    }

    @Transactional
    def update(CategoriaOpcaoCardapio categoriaOpcaoCardapioInstance) {
        if (categoriaOpcaoCardapioInstance == null) {
            notFound()
            return
        }

        if (categoriaOpcaoCardapioInstance.hasErrors()) {
            respond categoriaOpcaoCardapioInstance.errors, view:'edit'
            return
        }

        categoriaOpcaoCardapioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CategoriaOpcaoCardapio.label', default: 'CategoriaOpcaoCardapio'), categoriaOpcaoCardapioInstance.id])
                redirect categoriaOpcaoCardapioInstance
            }
            '*'{ respond categoriaOpcaoCardapioInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(CategoriaOpcaoCardapio categoriaOpcaoCardapioInstance) {

        if (categoriaOpcaoCardapioInstance == null) {
            notFound()
            return
        }

        categoriaOpcaoCardapioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CategoriaOpcaoCardapio.label', default: 'CategoriaOpcaoCardapio'), categoriaOpcaoCardapioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoriaOpcaoCardapio.label', default: 'CategoriaOpcaoCardapio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
