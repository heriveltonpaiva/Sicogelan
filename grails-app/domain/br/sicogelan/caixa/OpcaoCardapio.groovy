package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo

class OpcaoCardapio {

    String descricao
    double preco
    String observacao
    Arquivo arquivo
    Cardapio cardapio
    CategoriaOpcaoCardapio categoriaOpcaoCardapio

    static constraints = {

        descricao()
        preco()
        observacao()
        cardapio()
        arquivo()
        categoriaOpcaoCardapio()

    }
}
