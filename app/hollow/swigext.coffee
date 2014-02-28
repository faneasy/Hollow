###*
# @module hollow/swigext
# @date: 2014-02-23 10:38:44
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
# @desc
# swig 模板扩展 
# ------------------
#
# ## staticUrl
# 生成静态url
# ```html
# {{ 'style/hollow.css' | staticUrl }}
# ```
###

swig = require 'swig'
config = require '../../config'

swig.setFilter 'staticUrl', (input) ->
    url = input.toString()
    if '' != config.staticHost
        return "//#{config.staticHost}/#{url}"
    else
        return url

module.exports = swig
