###*
# @module models
# @date: 2014-02-22 11:31:01
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
#
# 存放所有 model 定义
# @desc
# ## demo:
# 
# ```coffee
# database = require './models'
#
# database.User.findAll().success (users) ->
#     console.log users
# ```
###

fs = require 'fs'
path = require 'path'
config = require '../config'
Sequelize = require 'sequelize'
lodash = require 'lodash'
database = {}



###*
# 实例化的 Sequelize
# @module models/sequelize
###
sequelize = new Sequelize(
    config.equelize_database,
    config.equelize_username,
    config.equelize_password,
        dialect: config.equelize_dialect
        host: config.equelize_host
        port: config.equelize_port
        maxConcurrentQueries: config.equelize_max_con
        pool: config.equelize_pool
        #sync: force: true
)

# 动态import model
fs.readdirSync(__dirname)
  .filter (file)->
      file.indexOf('.coffee') == -1 and
      file.indexOf('.') != 0 and
      file != 'index.js'
  .forEach (file)->
      model = sequelize.import path.join(__dirname, file)
      database[model.name] = model

Object.keys(database).forEach (modelName)->
    if 'associate' in database[modelName]
        database[modelName].associate database


module.exports = lodash.extend(
  sequelize: sequelize,
  Sequelize: Sequelize
, database)
