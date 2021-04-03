import moongoose from 'mongoose'

const user_schema = moongoose.Schema({
    user_id:{
        type: Number,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    },
    name: {
        type: String,
        required: true
    },
    surname: {
        type: String,
        required: true
    },
    address: {
        type: Object,
        required: true
    }
})

const user_model = moongoose.model('user', user_schema)

export default user_model