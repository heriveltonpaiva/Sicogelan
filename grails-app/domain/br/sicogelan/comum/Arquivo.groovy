package br.sicogelan.comum

import br.sicogelan.caixa.Cardapio
import br.sicogelan.caixa.CategoriaOpcaoCardapio
import br.sicogelan.caixa.OpcaoCardapio

class Arquivo {

    String nome
    String contentType;
    byte[] arquivo

    static constraints = {
        nome(blank:false)
        contentType()
        arquivo()
    }

    String toString(){
        return nome
    }
}
