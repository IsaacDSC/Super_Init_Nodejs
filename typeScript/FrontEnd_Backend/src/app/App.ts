import express from 'express'
import bodyParser from 'body-parser'
import router from '../routes/Routes'
import hbs from 'express-handlebars'
import path from 'path'
import session from'express-session'
import flash from'express-flash'
import cors from 'cors'
import { Request, Response, NextFunction } from 'express'

import passport from 'passport'
//import '../middlewares/checkCredencials';(passport)

class App {
    public express: express.Application
    constructor() {
        this.express = express()
        this.middlewares()
        this.session()
        this.flash()
        this.passport()
        this.routes()
        this.engine()
    }
    private middlewares(): void {
        this.express.use(bodyParser.urlencoded({ extended: false }))
        this.express.use(bodyParser.json())
        this.express.use(express.json())
        this.express.use(cors())
        this.express.use(express.static(path.join(__dirname, '../', 'public')))
    }
    private session(): void {
        this.express.use(session({
            secret: process.env.SECRETKEY_SESSION || 'somesecrettoken',
            resave: true,
            saveUninitialized: true
        }))
    }
    private flash(): void {
        this.express.use(flash())
        this.express.use((req:Request, res:Response, next: NextFunction) => {
            res.locals.success_msg = req.flash('success_msg')
            res.locals.error_msg = req.flash('error_msg')
            res.locals.message = req.flash('message')
            res.locals.error = req.flash('error')
            next()
        })
    }
    private passport(): void {
        this.express.use(passport.initialize())
        this.express.use(passport.session())
    }
    private routes(): void {
        this.express.use(router)
    }
    private engine(): void {
        this.express.engine('hbs', hbs({
            defaultLayout: 'main.hbs',
            extname: 'hbs',
        }));
        this.express.set('view engine', 'hbs');
        this.express.set('views', path.join(__dirname, '../', '/views/'))
    }
}
export default new App().express

