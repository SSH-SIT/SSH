const express = require('express')
const Router = express.Router()

const { getUsers } = require('../controllers/user-controllers')

Router.get('/users', getUsers)

module.exports = Router