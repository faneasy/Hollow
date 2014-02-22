###*
# Hollow 配置文件 
# 使用时，请 `mv config.default.js config.js`
# @date: 2014-02-22 10:48:42
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
###

pkg = require('./package.json')


# 静态文件cdn域名，如: cdn.dev.com，推荐 七牛， 每月免费10G流量
exports.static_host = ''

# 站点域名 如: hollow.catke.com
exports.host = '127.0.0.1'

exports.session_secret = 'hollow_catke'

exports.auth_cookie_name = 'hollow_catke'

# 数据库配置
exports.equelize_host = 'localhost'
exports.equelize_port = 5432
# 数据库最大连接数
exports.equelize_max_con = 100
# supported: 'mysql', 'sqlite', 'postgres', 'mariadb'
exports.equelize_dialect = 'postgres'

exports.equelize_database = 'hollow'
exports.equelize_username = 'hollow'
exports.equelize_password = ''

exports.equelize_pool =
    maxConnections: 5
    maxIdleTime: 30

