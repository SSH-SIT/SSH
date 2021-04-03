import moongoose from 'mongoose'

const product_categories_schema = moongoose.Schema({
    product_cat_id: {
        type: Number,
        required: true
    },
    product_cat_name: {
        type: String,
        required: true
    }
})

const product_categories_model = moongoose.model('product_categories', product_categories_schema)

export default product_categories_model