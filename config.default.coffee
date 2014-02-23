###*
# Hollow 配置文件 
# 使用时，请 `mv config.default.js config.js`
# @date: 2014-02-22 10:48:42
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
###

# 静态文件cdn域名，如: cdn.dev.com，推荐 七牛， 每月免费10G流量
exports.staticHost = '127.0.0.1'

# 站点域名 如: hollow.catke.com
exports.host = '127.0.0.1'

exports.sessionSecret = 'hollow_catke'

exports.authCookieName = 'hollow_catke'

# 数据库配置
exports.equelizeHost = 'localhost'
exports.equelizePort = 5432
# 数据库最大连接数
exports.equelizeMaxCon = 100
# supported: 'mysql', 'sqlite', 'postgres', 'mariadb'
exports.equelizeDialect = 'postgres'

exports.equelizeDatabase = 'hollow'
exports.equelizeUsername = 'hollow'
exports.equelizePassword = ''

exports.equelizePool =
    maxConnections: 5
    maxIdleTime: 30

