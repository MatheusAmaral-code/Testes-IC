import { http } from './config'

export default {
    listar:(value) => {
        return http.get('buscar?q=' + value)
    }
}