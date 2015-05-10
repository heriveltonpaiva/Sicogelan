package br.sicogelan.comum

class Arquivo {

    String nome
    String contentType
    Byte arquivo

    static constraints = {
        nome(blank:false)
        contentType()
        arquivo()
    }
}
