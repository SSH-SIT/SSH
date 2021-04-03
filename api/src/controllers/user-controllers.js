import User from '../models/user'

// GET Method

// POST Method
const login = async (req, res) => {
    try {
        const { email, password } = req.body

        

    } catch (err) {
        res.status(400).send({ msg: err.message })
    }
}

// PATCH Method

// DELETE Method

export default {

}