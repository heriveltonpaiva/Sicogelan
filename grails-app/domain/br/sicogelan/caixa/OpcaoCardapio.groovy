package br.sicogelan.caixa

import br.sicogelan.comum.Arquivo
import com.lowagie.text.pdf.AcroFields

class OpcaoCardapio {

    String descricao
    double preco
    String observacao
    Date dateCreated
    Date lastUpdated

    static belongsTo = [cardapio: Cardapio, categoriaOpcaoCardapio: CategoriaOpcaoCardapio, arquivo: Arquivo]
    static hasMany = [opcaoIngrediente:OpcaoIngrediente, itemPedido:ItemPedido]


    static constraints = {

        descricao()
        preco()
        observacao()
        cardapio()
        arquivo(nullable: true)
        categoriaOpcaoCardapio()

    }
    String toString(){
        return descricao
    }
}
