import express from 'express'
const router = express.Router()

//middlewares

//IMPORT CONTROLLERS
import homeController from '../controllers/homeController'

//NAVIGATIONS ROUTES
router.get('/', homeController.index)

export default router
