package br.sicogelan.caixa

class OpcaoUnidadeMedida {

    String descricao
    double valorAcrescido
    int quantidade
    double quantidadeReal
    Date dateCreated
    Date lastUpdated

    static belongsTo = [opcaoCardapio:OpcaoCardapio]
    static hasMany = [itemPedido:ItemPedido]

    static constraints = {
        descricao()
        valorAcrescido()
        quantidade()
        quantidadeReal()
        opcaoCardapio()
    }
    String toString(){
        return descricao
    }
}
