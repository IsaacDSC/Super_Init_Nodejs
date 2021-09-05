npm init -y
npm i typescript -D
tsc --init 
npm i bcrypt body-parser dotenv express express-flash express-handlebars express-session multer mysql mysql2 nodemailer passport passport-local sequelize sharp axios cors googleapis jsonwebtoken mercadopago nodemailer-express-handlebars cors
npm i -D @types/express @types/express-handlebars  @types/body-parser @types/express-session @types/express-flash @types/cors @types/mysql @types/bcrypt
mkdir tests src src/database src/database/settings src/database/tables src/database/migration src/database/procedules src/views src/views/layouts src/views/home src/views/partials src/public src/public/css src/public/js src/public/images src/controllers src/routes src/app src/config src/middlewares src/helpers src/models
touch src/Server.ts src/app/App.ts  src/routes/Routes.ts src/database/settings/Sql.ts src/database/tables/ClientsTable.ts src/database/settings/ConnSequelize.ts src/config/ConnDatabase.ts src/views/home/index.hbs src/views/layouts/main.hbs src/views/partials/_nav.hbs src/views/partials/_footer.hbs src/controllers/homeController.ts src/middlewares/checkCredencials.ts src/middlewares/auth.ts src/database/procedules/ExemplaProcedules.ts ./.env
