###*
# 
# @date: 2014-02-22 11:40:43
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
###

Sequelize = require 'sequelize'


module.exports = (sequelize, DataTypes) ->
    sequelize.define 'User',
        name:
            type: Sequelize.STRING
            validate:
                len: [3,20]
                is: ["[a-z]",'i']
                unique: true

        email:
            type: Sequelize.STRING
            validate:
                isEmail: true
                notNull: true
                notEmpty: true
                unique: true

        regDate:
            type: Sequelize.DATE
            defaultValue: Sequelize.NOW

        lastLoginDate: DataTypes.DATE

    
    
 
