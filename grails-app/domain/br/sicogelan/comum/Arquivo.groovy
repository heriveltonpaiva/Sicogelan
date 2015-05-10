package br.sicogelan.comum

class Arquivo {

    String nome
    String contentType
    byte[] arquivo

    static constraints = {
        nome(blank:false)
        contentType()
        arquivo()
    }
}
