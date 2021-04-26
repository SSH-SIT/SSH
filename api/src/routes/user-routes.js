const express = require('express')
const Router = express.Router()

const {
    getUsers,
    getOneUsers
} = require('../controllers/user-controllers')

Router.get('/users', getUsers)
Router.get('/users/:id', getOneUsers)

module.exports = Router