---
title: INITIALIZE PROJECT NODEJS ARCHITETURY
created: '2021-04-05T12:09:50.619Z'
modified: '2021-09-05T15:31:09.728Z'
---

# INITIALIZE PROJECT NODEJS ARCHITETURY

```
mkdir public public/js public/img public/css views views/layout views/partials controller routes config app middlewares
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
#### CREATE STRUCTURE FOLDERS USING JS
    
```
mkdir tests src src/database src/database/settings src/database/tables src/database/migration src/database/procedules src/views src/views/layouts src/views/home src/views/partials src/public src/public/css src/public/js src/public/images src/controllers src/routes src/app src/config src/middlewares src/helpers
```

#### CREATE STRUCTURE FOLDERS USING TS
```
mkdir tests src src/database src/database/settings src/database/tables src/database/migration src/database/procedules src/views src/views/layouts src/views/home src/views/partials src/public src/public/css src/public/js src/public/images src/controllers src/routes src/app src/config src/middlewares src/helpers

```
------------------- 

#### CREATE FILES STRUCTURE FILES JS
  ##### GENERATE SERVER.JS
```
touch src/Server.js src/app/App.js  src/routes/Routes.js src/database/settings/Sql.js src/database/tables/ClientsTable.js src/database/settings/ConnSequelize.js src/config/ConnDatabase.js src/views/home/index.hbs src/views/layouts/main.hbs src/views/partials/_nav.hbs src/views/partials/_footer.hbs src/controllers/homeController.js src/middlewares/checkCredencials.js src/middlewares/auth.js src/database/procedules/ExemplaProcedules.js ./.env
```

#### CREATE FILES STRUCTURE FILES TS
```
touch src/Server.js src/app/App.js  src/routes/Routes.js src/database/settings/Sql.js src/database/settings/sequelize.js src/config/ConnDatabase.js src/views/home/index.hbs src/views/layouts/main.hbs src/views/partials/_nav.hbs src/views/partials/_footer.hbs src/controllers/homeController.js src/middlewares/checkCredencials.js
```

---------------------------

#### INSTALL DEPENDENCIES JS (*Not use API*)
```
npm i bcrypt body-parser dotenv express express-flash express-handlebars express-session multer mysql mysql2 nodemailer passport passport-local sequelize sharp axios cors googleapis jsonwebtoken mercadopago nodemailer-express-handlebars
```
#### INSTALL DEPENDENCIES JS (*Use API*)
```
npm i bcrypt dotenv express mysql mysql2 nodemailer passport passport-local sequelize axios cors googleapis jsonwebtoken mercadopago nodemailer-express-handlebars
```
#### INSTALL DEPENDENCIES TS
```
npm i bcrypt dotenv express mysql mysql2 nodemailer passport passport-local sequelize axios cors googleapis jsonwebtoken mercadopago nodemailer-express-handlebars
```

------------------------------------


#### INSERT CODE STRUCTS JS
*App.js*
```
echo "
const express = require('express')
const bodyParser = require('body-parser')
const router = require('../routers/routes')
const hbs = require('express-handlebars')
const path = require('path')
const session = require('express-session')
const flash = require('express-flash')

const passport = require('passport')
require('../middleware/checkCredencials')(passport)

class App {
    constructor() {
        this.express = express()
        this.middlewares()
        this.session()
        this.flash()
        this.passport()
        this.routes()
        this.engine()
    }
    middlewares() {
        this.express.use(bodyParser.urlencoded({ extended: false }))
        this.express.use(bodyParser.json())
        this.express.use(express.static(path.join(__dirname, '../', 'public')))
    }
    session() {
        this.express.use(session({
            secret: process.env.SECRETKEY_SESSION || 'somesecrettoken',
            resave: true,
            saveUninitialized: true
        }))
    }
    flash() {
        this.express.use(flash())
        this.express.use((req, res, next) => {
            res.locals.success_msg = req.flash('success_msg')
            res.locals.error_msg = req.flash('error_msg')
            res.locals.message = req.flash('message')
            res.locals.error = req.flash('error')
            next()
        })
    }
    passport() {
        this.express.use(passport.initialize())
        this.express.use(passport.session())
    }
    routes() {
        this.express.use(router)
    }
    engine() {
        this.express.engine('hbs', hbs({
            defaultLayout: 'main.hbs',
            extname: 'hbs',
        }));
        this.express.set('view engine', 'hbs');
        this.express.set("views", path.join(__dirname, '../', "/views/"))
    }
}
module.exports = new App().express" >> src/app/App.js
```
*SERVER.JS*
```
echo "const app = require("./app");

const port = 3000

app.listen(process.env.PORT || port, () => {
    console.log('starter server in port: http://127.0.0.1:' + port)
});" >> src/Server.js
```
**
```
echo "
class AdminProcedules{
    async CreateAdmin(){
        try {

        } catch (error) {

        }
    }
    async EditAdmin(){
        try {

        } catch (error) {

        }
    }
    async DeleteAdmin(){
        try {

        } catch (error) {

        }
    }
}


module.exports = new AdminProcedules" >> src/database/procedules/ExemplaProcedules.js

```
*src/database/settings/Sql.js*
```
echo "

require('dotenv').config()
const mysql = require('mysql2')


const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    port: '3306' || process.env.DB_PORT,
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
})



module.exports = connection" >> src/database/settings/Sql.js
```

*src/database/settings/ConnSequelize.js*
```
echo "require('dotenv').config()
const mysql = require('mysql2')


const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    port: '3306' || process.env.DB_PORT,
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
})



module.exports = connection" >> src/database/settings/ConnSequelize.js
```

*src/database/tables/ClientsTable.js* 
```
echo "const { Model, DataTypes, Op } = require('sequelize');
const bcrypt = require('bcrypt')

class ClientsTable extends Model {
    static init(sequelize) {
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


    static hashPassword(models) {
        this.beforeSave(async(client, options) => {
            const hash = await bcrypt.hash(client.password, 10)
            return client.password = hash
        })
    }

}


module.exports = ClientsTable" >> src/database/tables/ClientsTable.js

```
*src/middlewares/checkCredencials.js*
```
echo "const passport = require('passport')
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


*src/middlewares/auth.js*
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
}" >> src/middlewares/auth.js
```



*src/routes/Routes.js*
```
echo"const express = require('express')
const router = express.Router()

//middlewares
const { auth } = require('../middleware/auth')

//IMPORT CONTROLLERS
const homeController = require('../controllers/homeController')

//NAVIGATIONS ROUTES
router.get('/new', homeController.index)

module.exports = router" >> src/routes/Routes.js
```

*src/controllers/homeController.js*
```
echo"class HomeController {
    async index(req, res){
        res.render('home/index')
    }
}

module.exports = new HomeController" >> src/controllers/homeController.js
```

*src/views/home/index.hbs*
```
echo" 
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















