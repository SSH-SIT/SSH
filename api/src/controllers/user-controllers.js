const Knex = require('../database/')

// GET Method
const getUsers = async (req, res) => {
    try {
        const users = await Knex("User")
            .innerJoin("Address", {
                'User.uid': 'Address.uid'
            }).select('*')

        return res.status(200).send(users)

    } catch (err) {
        return res.status(400).send({
            msg: err.message
        })
    }
}

const getOneUsers = async (req, res) => {
    try {
        const {
            id
        } = req.params
        const users = await Knex("User")
            .innerJoin("Address", {
                'User.uid': 'Address.uid'
            }).where({
                uid: id
            }).select('*')
        return res.status(200).send(users)

    } catch (err) {
        return res.status(400).send({
            msg: err.message
        })
    }
}

// POST Method

// PATCH Method

// DELETE Method

module.exports = {
    getUsers,
    getOneUsers
}