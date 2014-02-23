###*
# 
# @date: 2014-02-23 10:55:29
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
###

swig = require '../hollow/swigext'
sinon = require 'sinon'

describe 'module', ->
    describe 'staticUrl', ->
        it 'css url', ->
            swig.render('{{ 'style/hollow.css' | staticUrl }}')
                .should.be.equal('style/hollow.css')
            
