import {Request, Response} from 'express'

class HomeController {
    async index(req: Request, res: Response){
        res.render('home/index')
    }
}

export default new HomeController
