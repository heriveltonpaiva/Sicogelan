package br.sicogelan.caixa

class ItemPedido {

    int quantidade
    Date dateCreated
    OpcaoCardapio opcaoCardapio
    OpcaoUnidadeMedida opcaoUnidadeMedida
    Pedido pedido


    static mapping = {
        opcaoCardapio lazy: false
    }

    static constraints = {
        quantidade()
        opcaoCardapio()
        opcaoUnidadeMedida()
    }
    String toString(){
        if(opcaoCardapio==null){
            return "";
        }
        return opcaoCardapio.descricao
    }
}
