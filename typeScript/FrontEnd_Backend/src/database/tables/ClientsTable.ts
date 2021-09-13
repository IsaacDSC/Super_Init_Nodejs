const { Model, DataTypes, Op } = require('sequelize');
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


export default ClientsTable
const { Model, DataTypes, Op } = require('sequelize');
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


export default ClientsTable
