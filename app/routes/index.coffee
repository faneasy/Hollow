###*
# 首页 
# @date: 2014-02-28 23:06:49
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
###

exports.index = (req, res)->
    res.render 'index', title: 'Express'
