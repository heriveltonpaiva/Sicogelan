dataSource {
    pooled = true
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "dzjyfkpvqdaybm"
    password = "Shi4TpRjFO1uhMacHXpMnKYUJW"
    dbCreate = "create-drop"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:postgresql://localhost:5432/DbSicogelan"
            driverClassName = "org.postgresql.Driver"
            username = "postgres"
            password = "280394"
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:postgresql://localhost:5432/DbSicogelan"
        }
    }
    production {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:postgresql://ec2-54-83-41-183.compute-1.amazonaws.com:5432/d1s0kqc9r5ltai"
            username ="dzjyfkpvqdaybm"
            password ="Shi4TpRjFO1uhMacHXpMnKYUJW"
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 5000
               minEvictableIdleTimeMillis = 60000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}
