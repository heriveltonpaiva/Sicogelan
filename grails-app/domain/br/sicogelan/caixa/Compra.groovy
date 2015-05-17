package br.sicogelan.caixa

import br.sicogelan.comum.RegistroGeral

class Compra {

    double valor
    int quantidade
    double quantidadeReal
    String observacao
    Date dateCreated
    Date lastUpdated

    static belongsTo = [produto:Produto, registroGeral:RegistroGeral]
    static constraints = {

        produto()
        quantidade()
        quantidadeReal()
        observacao()
        registroGeral()
    }

}
