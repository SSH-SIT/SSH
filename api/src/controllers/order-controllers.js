const Knex = require('../database/')

const getOrder = async (req, res) => {
    try {
        const {
            id
        } = req.params
        const users = await Knex("Order")
            .innerJoin("Order_Detail", {
                'Order.order_id': 'Order_Detail.order_id'
            }).where({
                'Order.uid': id
            }).select('*')

        return res.status(200).send(users)

    } catch (err) {
        return res.status(400).send({
            msg: err.message
        })
    }
}
const getOneOrder = async (req, res) => {
    try {
        const {
            id
        } = req.params
        const users = await Knex("Order")
            .innerJoin("Order_Detail", {
                'Order.order_id': 'Order_Detail.order_id'
            }).where({
                'Order.order_id': order_id
            }).select('*')

        return res.status(200).send(users)

    } catch (err) {
        return res.status(400).send({
            msg: err.message
        })
    }
}
const getOneOrderFromUserID = async (req, res) => {
    try {
        const {
            id,
            order_id
        } = req.params
        const users = await Knex("Order")
            .innerJoin("Order_Detail", {
                'Order.order_id': 'Order_Detail.order_id'
            }).where({
                'Order.uid': id,
                'Order.order_id': order_id
            }).select('*')

        return res.status(200).send(users)

    } catch (err) {
        return res.status(400).send({
            msg: err.message
        })
    }
}


module.exports = {
    getOrder,
    getOneUsers,
    getOneOrderFromUserID
}