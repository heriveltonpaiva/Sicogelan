package br.sicogelan.caixa

class OpcaoIngrediente {

    int quantidade;
    double quantidade_real;
    Date dateCreated
    Date lastUpdated

    static belongsTo = [produto:Produto, opcaoCardapio:OpcaoCardapio]

    static constraints = {

         quantidade()
         quantidade_real()
         opcaoCardapio()
         produto()
    }
}
