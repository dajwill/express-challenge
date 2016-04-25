datetime = require 'node-datetime'

fib = (fibIndex) ->
  start = process.hrtime()
  if fibIndex < 2
    value = fibIndex
  else
    value = fib(fibIndex - 1).value + fib(fibIndex - 2).value
  elapsed = process.hrtime(start)
  return {
    value: value
    elapsed: elapsed
  }

module.exports = (fibIndex) ->
  response = fib(fibIndex)
  return {
    status: 200
    nth: fibIndex
    value: response.value
    timestamp: datetime.create().format('m/d/Y H:M:S')
    elapsed: "#{response.elapsed[1]/1000000}ms"
    type: 'recursive'
  }
