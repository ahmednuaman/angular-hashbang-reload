express = require 'express'
fs = require 'fs'
app = express()
port = process.env.PORT || 8000

app.configure () ->
  app.use (request, response, next) ->
    console.log "Requesting: #{request.url}"

    next()

  app.use '/', express.static "#{__dirname}/"

app.all '*', (request, response, next) ->
  response.sendfile "#{__dirname}/index.html"

app.listen port, () ->
  console.log "Listening on port: #{port}"