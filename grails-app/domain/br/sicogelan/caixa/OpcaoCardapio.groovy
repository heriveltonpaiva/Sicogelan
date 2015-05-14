package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo

class OpcaoCardapio {

    String descricao
    double preco
    String observacao
    Date dateCreated
    Date lastUpdated

    static belongsTo = [cardapio: Cardapio, categoriaOpcaoCardapio: CategoriaOpcaoCardapio, arquivo: Arquivo]

    //NÃO QUERO QUE FIQUE AUQI
    static hasMany = [
                      opcaoIngrediente:OpcaoIngrediente,
                     ]
    static hasOne = [itemPedido:ItemPedido,  opcaoUnidadeMedida:OpcaoUnidadeMedida]


    static constraints = {

        descricao()
        preco()
        observacao()
        cardapio()
        arquivo()
        categoriaOpcaoCardapio()

    }
}
