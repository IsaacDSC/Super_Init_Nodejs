---
title: INITIALIZE PROJECT NODEJS ARCHITETURY
created: '2021-04-05T12:09:50.619Z'
modified: '2021-09-05T15:31:09.728Z'
---

# INITIALIZE PROJECT NODEJS ARCHITETURY

#### INIT TYPESCRIPT

```shell
npm i -D typescript ts-node-dev
```

```shell
npm init
```

```shell
tsc --init
```

#### STRUCTURE USING JS
- tests
- src
    - database
      - settings
        - sql.js
        - sequelize.js
      - tables
      - migrations
      - procedules
    - views
      - layouts
        - main.hbs
      - home
        - index.hbs
      - partials
        - _nav.hbs
        - _footer.hbs
    - public
      - css
      - js
      - images
    - controllers      
      - HomeController.js
    - routes
      - Routes.js
    - app
      - App.js
    - config
      - ConnDatabase.js
      - config.js
    - middlewares
      - Auth.js
      - CheckAuth.js
    - helpers

--------------------
#### CREATE STRUCTURE FOLDERS USING TS

```shell
mkdir tests src src/database src/database/settings src/database/tables src/database/migration src/database/procedules src/views src/views/layouts src/views/home src/views/partials src/public src/public/css src/public/js src/public/images src/controllers src/routes src/app src/config src/middlewares src/helpers src/models
```

-------------------

#### CREATE FILES STRUCTURE FILES TS
```shell
touch src/Server.ts src/app/App.ts  src/routes/Routes.ts src/database/settings/Sql.ts src/database/tables/ClientsTable.ts src/database/settings/ConnSequelize.ts src/config/ConnDatabase.ts src/views/home/index.hbs src/views/layouts/main.hbs src/views/partials/_nav.hbs src/views/partials/_footer.hbs src/controllers/homeController.ts src/middlewares/checkCredencials.ts src/middlewares/auth.ts src/database/procedules/ExemplaProcedules.ts ./.env
```

---------------------------

#### INSTALL DEPENDENCIES JS (*Not use API*)
```
npm i bcrypt body-parser dotenv express express-flash express-handlebars express-session multer mysql mysql2 nodemailer passport passport-local sequelize sharp axios cors googleapis jsonwebtoken mercadopago nodemailer-express-handlebars cors
```
#### INSTALL TYPES USE TYPESCRIPT

```
npm i -D @types/express @types/express-handlebars  @types/body-parser @types/express-session @types/express-flash @types/cors @types/mysql @types/bcrypt @types/
```



#### INSTALL DEPENDENCIES TS
```
npm i bcrypt dotenv express mysql mysql2 nodemailer passport passport-local sequelize axios cors googleapis jsonwebtoken mercadopago nodemailer-express-handlebars 
```

------------------------------------


#### INSERT CODE STRUCTS JS
*App.js*
```javascript
echo "

import express from 'express'
import bodyParser from 'body-parser'
import router from '../routers/routes'
import hbs from 'express-handlebars'
import path from 'path'
import session from'express-session'
import flash from'express-flash'
import cors from 'cors'
import { Request, Response, NextFunction } from 'express'

const passport = require('passport')
require('../middleware/checkCredencials')(passport)

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
export default new App().express" >> src/app/App.ts
```
*SERVER.JS*
```
echo "import app from './app/App'

const port = 3000

app.listen(process.env.PORT || port, () => {
    console.log('starter server in port: http://127.0.0.1:' + port)
});" >> src/Server.ts
```
**

```
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

export default new AdminProcedules" >> src/database/procedules/ExemplaProcedules.ts

```
*src/database/settings/Sql.ts*

```
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

export default db" >> src/database/settings/Sql.ts
```



*src/database/settings/ConnSequelize.js*

```
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
})" >> src/database/settings/ConnSequelize.ts
```



*src/database/tables/ClientsTable.js* 

```
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


export default ClientsTable" >> src/database/tables/ClientsTable.ts

```


*src/middlewares/checkCredencials.js* => falta passar para typescript

```
echo "import passport from 'passport'
const LocalStrategy = require('passport-local').Strategy
const bcrypt = require('bcrypt')
const { dataUser } = require('../../data/user')
//models
const ClientsTable = require('../database/tables/ClientsTable.js')
const { countAccess, ERROS } = require('../helpers/countAcess')

const acess = (username, password, done) => {
    ClientsTable.findOne({ where: { username: username } }).then((user) => {
        if (!user) {
            const ERRORS = countAccess(1)
            // console.log(ERRORS)
            return done(null, false, { message: 'Esta conta não Existe' })
        }
        bcrypt.compare(password, user.password, (err, batem) => {
            if (batem) {
                dataUser(user.id, user.username, user.superuser, user.dealers, user.marketing)
                return done(null, user)
            } else {
                const ERRORS = countAccess(1)
                // console.log(ERRORS)
                console.log('senhas não batem')
                return done(null, false, { message: "E-mail ou Senha incorreta" })
            }
        })
    })
}

module.exports = function (passport) {
    passport.use(new LocalStrategy({
        usernameField: 'username',
        passwordField: 'password'
    }, (username, password, done) => {
        if (ERROS.stop <= 5) {
            acess(username, password, done)
        }
        if (ERROS.stop <= 20 && ERROS.stop > 5) {
            setTimeout(() => {
                acess(username, password, done)
            }, 60000)
        }
        if (ERROS.stop > 21) {
            console.log('HACKER TENTANDO USAR FORCE BRUTE')
        }
    }))

    passport.serializeUser((user, done) => {
        done(null, user.id)
    })

    passport.deserializeUser((id, done) => {
        ClientsTable.findOne({ where: { id: id } }).then((user) => {
            done(null, user)
        })
    })
}" >> src/middlewares/checkCredencials.js

```

*src/middlewares/auth.js* falta passar para Typescript

```
echo"module.exports = {
    auth: function(req, res, next) {
        if (req.isAuthenticated()) {
            req.session.save()
            return next()
        } else {
            req.flash('error_msg', 'Necessário realizar o login para acessar a pagina solicitada!')
            res.redirect('/account/login')
        }
    }
}" >> src/middlewares/auth.ts
```



*src/routes/Routes.ts

```
echo "import express from 'express'
const router = express.Router()

//middlewares
const { auth } = require('../middleware/auth')

//IMPORT CONTROLLERS
const homeController = require('../controllers/homeController')

//NAVIGATIONS ROUTES
router.get('/new', homeController.index)

export default router" >> src/routes/Routes.ts
```



*src/controllers/homeController.ts*

```
echo "import {Request, Response} from 'express'

class HomeController {
    async index(req: Request, res: Response){
        res.render('home/index')
    }
}

export default new HomeController" >> src/controllers/homeController.ts
```



*src/views/home/index.hbs*

```
echo " 
<h1> Hello Word </h1>" >> src/views/home/index.hbs
```



*src/views/layouts/main.hbs*

```
echo "<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <title>FineDrinks</title>

    <style>
        ul li {
            display: inline-block;
        }
        
        #footerSvg svg:hover path {
            transition: 2s;
            fill: #FE9500;
            font-size: 35px;
        }
        
        #footerSvg svg {
            width: 80mm;
            height: 20.2114mm;
        }
        
        #footerSvg svg path {
            fill: white;
        }
    </style>
</head>

<body>
    {{>_nav}}
    {{{body}}}
    {{>_footer}}

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>

</html>" >> src/views/layouts/main.hbs
```

*src/views/partials/_nav.hbs*
```
echo "<nav>NAVIGATE</nav>" >> src/views/partials/_nav.hbs
```

*src/views/partials/_footer.hbs*
```
echo "<footer>FOOTER</footer>" >> src/views/partials/_footer.hbs
```
*./.env*
```
echo "DB_HOST = localhost
DB_PORT = 3306
DB_NAME = solutionsTech
DB_USER = dev
DB_PASS = secret" >> ./.env
```
#### INSERT CODE STRUCTS TS
```
```
#### INSERT CODE STRUCTS JS *use API*
```
```
#### INSERT CODE STRUCTS TS *use API*
```
```















