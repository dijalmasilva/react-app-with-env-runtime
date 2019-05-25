const fs = require('fs')
const readLine = require('readline')

fs.unlink('./env-config.js', () => {})
fs.writeFileSync('./env-config.js', 'window._env_ = { \n')

const readInterface = readLine.createInterface({
    input: fs.createReadStream('.env')
})

readInterface.on('line', line => {
    if (line.includes("=")) {
        const pieces = line.split('=')

        const name = pieces[0].trim()
        let value = pieces[1].trim()

        const valueFromEnv = process.env[name]

        if (valueFromEnv) {
            value = valueFromEnv
        }

        fs.appendFileSync('./env-config.js', `  ${name}:"${value}",\n`)
    }
})

readInterface.on('close', () => {
    fs.appendFileSync('./env-config.js', '}')
})
