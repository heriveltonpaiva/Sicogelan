package br.sicogelan.caixa

class ItemPedido {

    int quantidade;
    OpcaoCardapio opcaoCardapio
    OpcaoUnidadeMedida opcaoUnidadeMedida

    static constraints = {
        quantidade()
        opcaoCardapio()
        opcaoUnidadeMedida()
    }
}
