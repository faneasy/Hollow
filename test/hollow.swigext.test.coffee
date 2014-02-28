###*
# 测试模板扩展
# @date: 2014-02-23 10:55:29
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
###
config = require '../config'
swig   = require '../app/hollow/swigext'
assert = require 'assert'


describe 'module', ->
    describe 'staticUrl', ->
        it 'css url', ->
            if config.staticHost == ''
                assert.equal(
                    swig.render("{{ 'style/hollow.css' | staticUrl }}"),
                    'style/hollow.css'
                )
            else
                assert.equal(
                    swig.render("{{ 'style/hollow.css' | staticUrl }}"),
                    "//#{config.staticHost}/style/hollow.css"
                )
            
