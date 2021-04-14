import { action } from 'easy-peasy'

const adminState = {
    admin: null,
    set: action((state, admin) => {
        state.admin = admin
    })
}

export default adminState