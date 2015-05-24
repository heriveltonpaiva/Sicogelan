package br.sicogelan.caixa

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class ItemPedidoController {

    def listaItemPedidos = new ArrayList<ItemPedido>()
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 5, 100)
        respond ItemPedido.list(params), model:[itemPedidoInstanceCount: ItemPedido.count()]
    }

    def show(ItemPedido itemPedidoInstance) {
        respond itemPedidoInstance
    }

    def create() {
        respond new ItemPedido(params)

    }

    /**
     * Adiciona os itens pedidos a uma lista temporária
     * @param itemPedidoInstance
     * @return
     */
    def adicionarItem(ItemPedido itemPedidoInstance){

        itemPedidoInstance = new ItemPedido(params)
        listaItemPedidos.add(itemPedidoInstance)

        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
                // Exibir a mensagem de cadastro e continuar na memsa página
                render view:'adicionarItem', model:[lista: listaItemPedidos]
            }
            '*' { render action:'adicionarItem', model:[lista: listaItemPedidos] }
        }
    }


    @Transactional
    def save(ItemPedido itemPedidoInstance) {
        if (itemPedidoInstance == null) {
            notFound()
            return
        }

        if (itemPedidoInstance.hasErrors()) {
            respond itemPedidoInstance.errors, view:'create'
            return
        }

        itemPedidoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = 'Cadastro Realizado com Sucesso.'
                // Exibir a mensagem de cadastro e continuar na memsa página
                redirect action:"create"
            }
            '*' { render  status: CREATED}
        }
    }

    def edit(ItemPedido itemPedidoInstance) {
        respond itemPedidoInstance
    }

    @Transactional
    def update(ItemPedido itemPedidoInstance) {
        if (itemPedidoInstance == null) {
            notFound()
            return
        }

        if (itemPedidoInstance.hasErrors()) {
            respond itemPedidoInstance.errors, view:'edit'
            return
        }

        itemPedidoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ItemPedido.label', default: 'ItemPedido'), itemPedidoInstance.id])
                redirect itemPedidoInstance
            }
            '*'{ respond itemPedidoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ItemPedido itemPedidoInstance) {

        if (itemPedidoInstance == null) {
            notFound()
            return
        }

        itemPedidoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ItemPedido.label', default: 'ItemPedido'), itemPedidoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemPedido.label', default: 'ItemPedido'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
