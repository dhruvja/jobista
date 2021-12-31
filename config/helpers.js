let mysqli = require('mysqli')

let conn = new mysqli({
    host: 'localhost',
    port: '3306',
    user: 'root',
    passwd: 'password',
    db: 'jobify'
})

let db = conn.emit()

module.exports = {
    database: db
}