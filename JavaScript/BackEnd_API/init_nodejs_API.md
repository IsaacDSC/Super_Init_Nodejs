---
title: INITIALIZE PROJECT NODEJS ARCHITETURY
created: '2021-04-05T12:09:50.619Z'
modified: '2021-09-05T15:31:09.728Z'
---

# INITIALIZE PROJECT NODEJS ARCHITETURY

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

```sh
mkdir tests src src/database src/database/settings src/database/tables src/database/migration src/database/procedules src/controllers src/routes src/app src/config src/middlewares src/helpers
```



-------------------

#### CREATE FILES STRUCTURE FILES JS
```shell
touch src/Server.js src/app/App.js  src/routes/Routes.js src/database/settings/Sql.js src/database/tables/ClientsTable.js src/database/settings/ConnSequelize.js src/config/ConnDatabase.js src/controllers/homeController.js src/middlewares/checkCredencials.js src/middlewares/auth.js src/database/procedules/ExemplaProcedules.js ./.env .sequelizerc
```

#### INSTALL DEPENDENCIES JS (*Use API*)
```sh
npm i bcrypt dotenv express mysql mysql2 nodemailer passport passport-local sequelize axios cors googleapis jsonwebtoken mercadopago nodemailer-express-handlebars
```
------------------------------------


#### INSERT CODE STRUCTS JS
*App.js*

```javascript
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
        this.passport()
        this.routes()        
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
    passport() {
        this.express.use(passport.initialize())
        this.express.use(passport.session())
    }
    routes() {
        this.express.use(router)
    }   
}
module.exports = new App().express" >> src/app/App.js
```
*SERVER.JS*

```javascript
echo "const app = require('./app/App.js');

const port = 3000

app.listen(process.env.PORT || port, () => {
    console.log('starter server in port: http://127.0.0.1:' + port)
});" >> src/Server.js
```
**
```javascript
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

```javascript
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
```javascript
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
```javascript
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

```javascript
echo "const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy
const bcrypt = require('bcrypt')
const ClientsTable = require('../database/tables/ClientsTable.js')
const acess = (username, password, done) => {
    ClientsTable.findOne({ where: { username: username } }).then((user) => {
        if (!user) {           
            return done(null, false, { message: 'Esta conta não Existe' })
        }
        bcrypt.compare(password, user.password, (err, batem) => {
            if (batem) {            
                return done(null, user)
            } else {                
                return done(null, false, { message: 'E-mail ou Senha incorreta' })
            }
        })
    })
}
module.exports = function (passport) {
    passport.use(new LocalStrategy({
        usernameField: 'username',
        passwordField: 'password'
    }, (username, password, done) => {
        acess(username, password, done)        
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

```javascript
echo "module.exports = {
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
```javascript
echo "const express = require('express')
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
```javascript
echo "class HomeController {
    async index(req, res){
        res.render('home/index')
    }
}

module.exports = new HomeController" >> src/controllers/homeController.js
```

*./.env*

```
echo "DB_HOST = localhost
DB_PORT = 3306
DB_NAME = solutionsTech
DB_USER = dev
DB_PASS = secret" >> ./.env
```


*.sequelizerc*

```javascript
const path = require('path')

module.exports = {
    config: path.resolve(__dirname, 'src', 'config', 'database.js'),
    'migrations-path': path.resolve(__dirname, 'src', 'database', 'migrations')
}
```









