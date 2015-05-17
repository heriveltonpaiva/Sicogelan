package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo

class CategoriaOpcaoCardapio {

    String descricao;
    Date dateCreated
    Date lastUpdated

    static belongsTo = [arquivo:Arquivo]
    static hasMany = [opcaoCardapio: OpcaoCardapio]

    static constraints = {
        descricao()
        arquivo()
    }
    String toString(){
        return descricao
    }
}
