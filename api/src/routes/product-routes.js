const express = require('express')
const Router = express.Router()

const {
    getProduct,
    getOneProduct
} = require('../controllers/product-controllers')

Router.get('/product', getProduct)
Router.get('/product/:pid', getOneProduct)

module.exports = Router