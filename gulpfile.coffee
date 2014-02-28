###*
# 
# @date: 2014-02-23 08:44:03
# @author: vfasky (vfasky@gmail.com)
# @link: http://vfasky.com
# @version: $Id$
###

gulp = require 'gulp'
process = require 'child_process'
path = require 'path'
fs = require 'fs'
less = require 'less'
docco = require 'gulp-docco'
watch = require 'gulp-watch'
# 生成文档
_buildNodeDocTime = null
buildNodeDoc = ->
    if _buildNodeDocTime
        clearTimeout _buildNodeDocTime
    
    _buildNodeDocTime = setTimeout ->
        process.exec 'docco -l README.md app/hollow/*.coffee app/models/*.coffee app/routes/*.coffee', (err, stdout, stderr) ->
            if err
                console.log 'error: ' + err
            else if stdout
                console.log stdout
        
        return
    , 1000

    return

# 生成less
_buildLessTime = null
buildLess = ->
    if _buildLessTime
        clearTimeout _buildLessTime
    
    basePath = path.join(__dirname, 'public', 'style')
    filePath = path.join(basePath,  'hollow.less')

    _buildLessTime = setTimeout ->
        fs.readFile filePath, 'utf-8', (err, lessStr) ->
            parser = less.Parser
            parser = new parser paths: [basePath]
            
            parser.parse lessStr, (err, tree) ->
                if err
                    console.log err
                    return
                
                css = tree.toCSS compress: true

                fs.writeFile path.join(basePath, 'hollow.css'), css, (err) ->
                    if err
                        console.log err
                    
                

    , 1000


#gulp.watch ['README.md', 'app/**'], (event) ->
    ##console.log('File '+event.path+' was '+event.type+', running tasks...');
    #buildNodeDoc()

#gulp.src ['README.md', 'app/*.coffee']
    #.pipe(docco())
    #.pipe(gulp.dest('./docs'))

gulp.task 'default', ->
    gulp.src ['app/**/*.coffee', 'README.md']
        .pipe watch (files)->
            files.pipe docco layout: 'linear'
                 .pipe gulp.dest('./docs/')
        
