package br.sicogelan.caixa

class Produto {

    String descricao
    int quantidade
    double quantidadeReal
    int quantidadeMinima
    double quantidadeMinimaReal

    static constraints = {

        descricao(blank: false)
        quantidade()
        quantidadeReal()
        quantidadeMinima()
        quantidadeMinimaReal()
    }
}
