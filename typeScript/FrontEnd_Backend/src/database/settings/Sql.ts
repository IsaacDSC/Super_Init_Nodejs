
require('dotenv').config()
import mysql from 'mysql2'

const conn = mysql.createConnection({
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
})

const db = conn.connect()

export default db
