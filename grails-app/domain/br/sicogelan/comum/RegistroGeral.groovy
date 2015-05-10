package br.sicogelan.comum

import br.sicogelan.seguranca.Usuario

class RegistroGeral {

    Date dateCreated
    String permissao
    String ip
    Usuario usuario

    static constraints = {

        permissao()
        ip()
        usuario()
    }
}
