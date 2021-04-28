const express = require('express')
const dotenv = require('dotenv')
const cors = require('cors')

const routes = require('./src/routes')


if (process.env.NODE_ENV !== 'production')
    dotenv.config()

const app = express()

app.use(routes)

app.use(express.json())
app.use(express.urlencoded({ extended: true }))


// const corsMiddleware = cors({
//     credentials: true,
//     origin: [process.env.ENTRYPOINT_URL, process.env.CLIENT_URL],
//     methods: ['GET', 'PUT', 'POST', 'PATCH', 'DELETE']
// })

// app.use(corsMiddleware)
// app.options('*', cors(corsMiddleware))

module.exports = app
