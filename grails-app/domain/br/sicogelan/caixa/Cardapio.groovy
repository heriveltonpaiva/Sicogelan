package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo

class Cardapio {

    String descricao
    Date dateCreated
    Date lastUpdated

    static belongsTo= [arquivo: Arquivo]

    static constraints = {
        descricao(blank: false)
    }


}
