import mongoose from 'mongoose'

const counter_schema = mongoose.Schema({
    counter_num: {
        type: Number,
        required: true
    },
    counter_name: {
        type: String,
        required: true
    }
})

const counter_model = mongoose.model('counter', counter_schema)

export default counter_model