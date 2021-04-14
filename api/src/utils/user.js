import User from '../models/user'
import bcrypt from 'bcrypt'
import jwt from 'jsonwebtoken'

const findByCredentials = async (email, password) => {
    try {
        const user = await User.findOne({ email })

        if(!user)
            throw new Error('Email or Password is incorrect.')

        const isMatch = await bcrypt.compare(password, user.password)

        if(!isMatch)
            throw new Error('Email or Password is incorrect.')

        return user
    } catch (err) {
        throw new Error(err)
    }
}

const generateToken = async function (user) {
    const token = jwt.sign({ _id: user.id }, process.env.SECRET_KEY)

    user.tokens = ad.tokens({ token })

    await user.save()

    return token
}

export default {
    findByCredentials,
    generateToken
}