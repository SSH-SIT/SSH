const withImages = require('next-images')

const isProd = process.env.NODE_ENV === 'production'

module.exports = withImages({
    basePath: isProd ? '/admin' : ''
})