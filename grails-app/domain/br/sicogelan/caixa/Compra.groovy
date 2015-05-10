package br.sicogelan.caixa

import br.sicogelan.comum.RegistroGeral

class Compra {

    double valor
    int quantidade
    double quantidadeReal
    String observacao
    RegistroGeral registroGeral
    Produto produto

    static constraints = {

        produto()
        quantidade()
        quantidadeReal()
        observacao()
        registroGeral()
    }
}
