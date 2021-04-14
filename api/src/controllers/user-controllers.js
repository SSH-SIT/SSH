const Knex = require('../database/')

// GET Method
const getUsers =  async (req, res) => {
    try {
        const users = await Knex.select('*').from('User')

        res.status(200).send(users)

    } catch(err) {
        res.status(400).send({ msg: err.message })
    }
}

// POST Method

// PATCH Method

// DELETE Method

module.exports = {
    getUsers
}