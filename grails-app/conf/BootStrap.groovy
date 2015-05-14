import br.sicogelan.seguranca.*

class BootStrap {

    def init = { servletContext ->

        def adminRole = new Papel(authority: 'ROLE_ADMIN').save(flush: true)
      //  def userRole = new Papel(authority: 'ROLE_USER').save(flush: true)

      //  def testUser = new Usuario(username: 'me', password: 'password')
     //   testUser.save(flush: true)
        def adminUser = Usuario.findByUsername('admin') ?: new Usuario( username: 'admin', password: 'admin', enabled: true).save(failOnError: true)


       // if (!adminUser.authorities.contains(adminRole)) { UsuarioPapel.create adminUser, adminRole, true }

        UsuarioPapel.create adminUser, adminRole, true
     //   assert Usuario.count() == 1
     //   assert Papel.count() == 2
    //    assert UsuarioPapel.count() == 1
    }
    def destroy = {
    }
}
