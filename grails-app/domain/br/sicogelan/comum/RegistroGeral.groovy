package br.sicogelan.comum

import br.sicogelan.seguranca.Usuario
import br.sicogelan.caixa.Compra
import br.sicogelan.caixa.Pedido
class RegistroGeral {

    String permissao
    String ip
    Date dateCreated
    Date lastUpdated

    static hasOne = [compra:Compra, pedido:Pedido]

    static constraints = {

        permissao()
        ip()
    }
}
