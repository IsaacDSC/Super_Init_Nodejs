#----------------------------------APP--------------------------
echo "import express from 'express'
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
" >> ./src/app/App.ts

# ------------------------- SERVER---------------------------

echo "import app from './app/App'

const port = 3000

app.listen(process.env.PORT || port, () => {
    console.log('starter server in port: http://127.0.0.1:' + port)
});" >> ./src/Server.ts


# ---------------------- PROCEDULES ----------------------------
echo "

class AdminProcedules{
    public async CreateAdmin(){
        try {

        } catch (error) {

        }
    }
    public async EditAdmin(){
        try {

        } catch (error) {

        }
    }
    public async DeleteAdmin(){
        try {

        } catch (error) {

        }
    }
}

export default new AdminProcedules" >> ./src/database/procedules/ExemplaProcedules.ts

# ------------------------------ SETTINGS DATABASE ----------------------------
echo "
require('dotenv').config()
import mysql from 'mysql2'

const conn = mysql.createConnection({
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
})

const db = conn.connect()

export default db" >> ./src/database/settings/Sql.ts

echo "require('dotenv').config()
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
})" >> ./src/database/settings/ConnSequelize.ts


# -----------------------------------TABLES--------------------------

echo "const { Model, DataTypes, Op } = require('sequelize');
import bcrypt from 'bcrypt'
import { Sequelize } from 'sequelize/types';


class ClientsTable extends Model {
    static init(sequelize: Sequelize) {
        super.init({
            name: DataTypes.STRING,
            profile: DataTypes.STRING,
            username: DataTypes.STRING,
            email: DataTypes.STRING,
            telephone: DataTypes.STRING,
            password: DataTypes.STRING,
            superuser: DataTypes.BOOLEAN,
            dealers: DataTypes.BOOLEAN,
            marketing: DataTypes.BOOLEAN,
        }, {
            sequelize,
            tableName: 'solutionsAccount',

        })
    }


    static hashPassword(models: void) {
        this.beforeSave(async(client:any, options: any) => {
            const hash = await bcrypt.hash(client.password, 10)
            return client.password = hash
        })
    }

}


export default ClientsTable" >> ./src/database/tables/ClientsTable.ts


# --------------------------------ROUTER ----------------------------
echo "import express from 'express'
const router = express.Router()

//middlewares

//IMPORT CONTROLLERS
import homeController from '../controllers/homeController'

//NAVIGATIONS ROUTES
router.get('/', homeController.index)

export default router" >> ./src/routes/Routes.ts



# -------------------------------CONTROLLERS ----------------------------

echo "import {Request, Response} from 'express'

class HomeController {
    async index(req: Request, res: Response){
        res.render('home/index')
    }
}

export default new HomeController" >> ./src/controllers/homeController.ts

# ------------------------------VIEWS-----------------------------------
echo "
    {{>_nav}}
    {{{body}}}
    {{>_footer}}
" >> ./src/views/layouts/main.hbs
echo "
<h1> Hello Word </h1>" >> ./src/views/home/index.hbs
echo "<nav>NAVIGATE</nav>" >> ./src/views/partials/_nav.hbs
echo "<footer>FOOTER</footer>" >> ./src/views/partials/_footer.hbs


#--------------------------------TESTES---------------------------
echo "" >> ./tests/First.spec.ts