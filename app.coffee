###
Module dependencies.
###

express = require 'express'
routes = require './routes'
nib = require 'nib'
stylus = require 'stylus'

app = module.exports = express.createServer()

# Configuration

app.configure ->
  app.set 'views',  __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session { secret: 'your secret here' }
  app.use require('stylus').middleware { src: __dirname + '/public', compile: (str, path)->
    return stylus(str)
      .set('filename', path)
      .set('compress', true)
      .use(nib())
  }

  app.use express.compiler(src: __dirname + '/public', enable: ['coffeescript'])

  app.use app.router
  app.use express.static __dirname + '/public'

app.configure 'development', ->
  app.use express.errorHandler { dumpExceptions: true, showStack: true }

app.configure 'production', ->
  app.use express.errorHandler()

# Routes

app.get '/', routes.index
app.get '/player', routes.player

# Start Server

port = process.env.PORT || 3000
 
app.listen port
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env
