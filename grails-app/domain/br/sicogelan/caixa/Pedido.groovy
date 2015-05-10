package br.sicogelan.caixa

import br.sicogelan.comum.RegistroGeral

class Pedido {
    //Para fazer, feito, fazendo, servido, finalizado
     String status
     double valorTotal
    //Para Local ou Viagem
     String statusConsumo
     ItemPedido itemPedido
     Mesa mesa
     RegistroGeral registroGeral

    static constraints = {

        status()
        valorTotal()
        statusConsumo()
        itemPedido()
        mesa()
        registroGeral()
    }
}
