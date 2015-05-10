package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo

class CategoriaOpcaoCardapio {

    String descricao;
    Arquivo arquivo

    static constraints = {
        descricao()
        arquivo()
    }
}
