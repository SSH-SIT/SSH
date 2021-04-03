import moongose from 'mongoose'

const prodcut_schema = moongose.Schema({
    product_id: {
        type: Number,
        required: true
    },
    product_name: {
        type: String,
        required: true
    },
    product_cat: {
        type: Number,
        required: true
    },
    price: {
        type: Number,
        required: true
    },
    orderRanking: {
        type: Number,
        default: 0
    }
})

const product_model = moongose.model('product', prodcut_schema)

export default product_model