package br.sicogelan.caixa

class ItemPedido {

    int quantidade;
    Date dateCreated

    static hasMany = [pedido: Pedido]
    static belongsTo = [opcaoCardapio:OpcaoCardapio, opcaoUnidadeMedida:OpcaoUnidadeMedida]


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
