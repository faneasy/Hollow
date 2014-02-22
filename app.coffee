###*
# Hollow ，没有威权的社区
###

express = require 'express'
http = require 'http'
path = require 'path'
swig = require 'swig'

routes = require './routes'
config = require './config'
database = require './models'

app = express()

app.engine('html', swig.renderFile)

app.set('port', process.env.PORT or 80)
app.set('view engine', 'html')
app.set('views', path.join(__dirname, 'views'))

app.use express.favicon()
app.use express.logger('dev')
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, 'public'))

#app.use express.cookieParser()
#app.use express.session -> config.session_secret
#app.use passport.initialize()

if 'development' == app.get('env')
    # 开发环境的设置
    app.set('view cache', false)
    swig.setDefaults cache: false

    app.use express.errorHandler()

# 路由绑定
app.get('/', routes.index)


database.sequelize
        .sync(force: true)
        .complete (err) ->
            if err
                throw err
            
            http.createServer(app).listen app.get('port'), ->
                console.log 'Express server listening on port ' + app.get('port')
                return

