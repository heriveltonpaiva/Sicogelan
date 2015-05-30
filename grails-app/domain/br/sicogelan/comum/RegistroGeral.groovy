package br.sicogelan.comum

import br.sicogelan.seguranca.Usuario
import br.sicogelan.caixa.Compra
import br.sicogelan.caixa.Pedido
class RegistroGeral {

    String permissao
    String ip
    Date dateCreated
    Date lastUpdated
    Usuario usuario

    static constraints = {

        permissao()
        ip()
        usuario()
    }
}
