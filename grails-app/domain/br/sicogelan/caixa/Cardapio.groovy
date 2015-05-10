package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo

class Cardapio {

    String descricao
    Arquivo arquivo

    static constraints = {

        descricao()
        arquivo()
    }
}
