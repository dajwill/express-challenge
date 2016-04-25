datetime = require 'node-datetime'
fibArray = [0,1]
# start = process.hrtime()

module.exports = (fibIndex) ->
  start = process.hrtime()
  # start = new Date();
  if fibIndex > 1
    i = 2
    while i < fibIndex + 1
      fibArray.push fibArray[fibArray.length - 1] + fibArray[fibArray.length - 2]
      i++

  elapsed = process.hrtime(start)

  return {
    status: 200
    nth: fibIndex
    value: fibArray[fibIndex]
    timestamp: datetime.create().format('m/d/Y H:M:S')
    elapsed: "#{elapsed[1]/1000000}ms"
  }
