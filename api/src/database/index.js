import moongoose from 'mongoose'

moongoose.connect(process.env.DATABASE_URI, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true
})
.then(() => console.log('Connection Successful'))
.catch(err => console.log(err))