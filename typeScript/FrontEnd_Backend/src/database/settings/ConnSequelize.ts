require('dotenv').config()
import {Sequelize} from 'sequelize'


export const database = new Sequelize({
  dialect: 'mysql',
  host: process.env.DB_HOST,
  port: '3306' || process.env.DB_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  define:{
    timestamps: true
  }
})
