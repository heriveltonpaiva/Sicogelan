package br.sicogelan.caixa

import br.sicogelan.comum.RegistroGeral
import br.sicogelan.seguranca.Usuario
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import groovy.json.JsonSlurper
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
@Transactional(readOnly = true)
@Secured('isAuthenticated()')
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
     * Adiciona os itens pedidos a uma lista temporária e retorna como JSON para ser listado usando AJAX
     * @param itemPedidoInstance
     * @return
     */
    def adicionarItem(ItemPedido itemPedidoInstance){

        itemPedidoInstance = new ItemPedido(params)
        listaItemPedidos.add(itemPedidoInstance)

        def retorno = [:]
        retorno += ['item': itemPedidoInstance]
        retorno += ['descricao': itemPedidoInstance.opcaoCardapio.descricao]
        retorno += ['preco': itemPedidoInstance.opcaoCardapio.preco]
        retorno += ['unidadeMedida':itemPedidoInstance.opcaoUnidadeMedida.descricao]
        retorno += ['valorAcrescido':itemPedidoInstance.opcaoUnidadeMedida.valorAcrescido]

        render retorno as JSON
    }

    /**
     * Cria um novo Pedido, recupera a Lista de Itens Pedidos e Salva a Lista pedidos vinculado um Pedido.
     * @return
     */
    @Transactional
    def save() {

        def pedido = new Pedido(params)

        def registroGeral = new RegistroGeral()


        registroGeral.setIp(request.getRemoteAddr())
        registroGeral.setUsuario(Usuario.findByUsername('admin'))
        println getSession().getAttribute('username')
        registroGeral.setPermissao('Acesso')
        registroGeral.save(flush: true)

        def valorTotal = 0;
        listaItemPedidos.each {
            it.setPedido(pedido)
            valorTotal += it.quantidade*(it.opcaoUnidadeMedida.valorAcrescido+it.opcaoCardapio.preco)
        }

        pedido.setRegistroGeral(registroGeral)
        pedido.setStatus('Para Fazer')
        pedido.setValorTotal(valorTotal)
        pedido.save(flush: true)


        ItemPedido.saveAll(listaItemPedidos)
        listaItemPedidos = new ArrayList<ItemPedido>()
        request.withFormat {
            form multipartForm {
                flash.message = 'Pedido Realizado com Sucesso.'
                redirect action:"create"
            }
            '*' { render  status: CREATED}
        }
    }

    @Secured(['ROLE_ADMIN'])
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

    @Secured(['ROLE_ADMIN'])
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
