package br.sicogelan.caixa

class Mesa {

    String descricao
    //Disponivel ou Ocupada
    String status
    //QR Code
    String codigo;
    Date dateCreated


    static constraints = {

        descricao()
        status()
        codigo()

    }
}
