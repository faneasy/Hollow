###*
# session Table 
# @date: 2014-03-04 21:41:55
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
###

Sequelize = require 'sequelize'

module.exports = (sequelize, DataTypes) ->
    sequelize.define 'Session',
        sid:
            type: DataTypes.STRING
            primaryKey: true

        data: DataTypes.TEXT
