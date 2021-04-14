import { persist } from 'easy-peasy'

import adminState from './admin'

const storeModel = persist(
    { adminState },
    {
        storage: 'localStorage'
    }
)

export default storeModel