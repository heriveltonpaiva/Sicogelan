package br.sicogelan.caixa

import br.sicogelan.comum.RegistroGeral

class Pedido {
    //Para fazer, feito, fazendo, servido, finalizado
     String status
     double valorTotal
    //Para Local ou Viagem
     String statusConsumo
     Mesa mesa
     RegistroGeral registroGeral

    static constraints = {
        status()
        valorTotal()
        statusConsumo()
        mesa()
        registroGeral()
    }
    String toString(){
        return status +" - "+statusConsumo+ '-'+mesa+' - '+valorTotal +' - '+registroGeral
    }
}
