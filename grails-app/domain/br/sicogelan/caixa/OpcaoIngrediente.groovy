package br.sicogelan.caixa

class OpcaoIngrediente {

    int quantidade;
    double quantidade_real;
    OpcaoCardapio opcaoCardapio
    Produto produto

    static constraints = {

         quantidade()
         quantidade_real()
         opcaoCardapio()
         produto()
    }
}
