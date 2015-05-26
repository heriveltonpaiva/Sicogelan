package br.sicogelan.caixa

class ItemPedido {

    int quantidade
    Date dateCreated
    OpcaoCardapio opcaoCardapio
    OpcaoUnidadeMedida opcaoUnidadeMedida

    static hasMany = [pedido: Pedido]


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
