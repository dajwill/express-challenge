express = require('express')
app = express()

app.get '/test', (req, res) ->
  fib = require './fib.coffee'
  res.setHeader('Content-Type', 'application/json');
  res.sendStatus(JSON.stringify fib(6))

app.get '/', (req, res) ->
  res.send 'Hello World!'

app.get '/:num/:key?', (req, res) ->
  index = parseInt(req.params.num)
  key = req.params.key
  if isNaN(index)
    res.send {
      status: 400
      message: 'Invalid index. Must enter an integer!'
    }
  else
    if !key? || key == 'i'
      iterativeFib = require './fib.coffee'
      res.sendStatus(JSON.stringify iterativeFib(index))
    else if key == 'r'
      recursiveFib = require './recursive-fib.coffee'
      res.sendStatus(JSON.stringify recursiveFib(index))
    else
      res.send {
        status: 400
        message: 'Invalid key.'
        key: key
      }

app.listen 3000, ->
  console.log 'Example app listening on port 3000!'
  return
