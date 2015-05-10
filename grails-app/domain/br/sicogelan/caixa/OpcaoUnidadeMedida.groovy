package br.sicogelan.caixa

class OpcaoUnidadeMedida {

    String descricao
    double valorAcrescido
    int quantidade
    double quantidadeReal
    OpcaoCardapio opcaoCardapio

    static constraints = {
        descricao()
        valorAcrescido()
        quantidade()
        quantidadeReal()
        opcaoCardapio()
    }
}
