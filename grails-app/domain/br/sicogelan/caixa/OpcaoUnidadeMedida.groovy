package br.sicogelan.caixa

class OpcaoUnidadeMedida {

    String descricao
    double valorAcrescido
    int quantidade
    double quantidadeReal
    Date dateCreated
    Date lastUpdated

    static hasOne = [itemPedido:ItemPedido]
    static belongsTo = [opcaoCardapio:OpcaoCardapio]


    static constraints = {
        descricao()
        valorAcrescido()
        quantidade()
        quantidadeReal()
        opcaoCardapio()
    }
}
