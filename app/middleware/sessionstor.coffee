###*
# session 中间件 
# @date: 2014-03-04 21:47:25
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
###

class SessionStore

    constructor: (@SessionModel) ->


    destroy: (sid, callback) ->
        success = (session) ->
            if session == null
                 callback()
             else
                 session.destroy()
                        .success -> callback()
                        .error (err)-> callback err


        @SessionModel.find(where: sid: sid)
                     .success success
                     .error (err)-> callback err


    length: (callback) ->
        @SessionModel.count()
                     .success (count)-> callback(null, count)
                     .error (err)-> callback err


    get: (sid, callback) ->
        success = (session) ->
            if session
                callback(null, JSON.parse session.data)
            else
                callback(null, null)

        @SessionModel.find(where: sid: sid)
                     .success success
                     .error (err)-> callback err


    set: (sid, data, callback) ->
        @SessionModel.findOrCreate(
            {sid: sid},
            {data: JSON.stringify(data)}
        ).success (session)-> callback(null, session)
         .error (err)-> callback err
        

module.exports = (connect) ->

  SessionStore:: __proto__ = connect.session.Store.prototype

  (model) -> new SessionStore model
