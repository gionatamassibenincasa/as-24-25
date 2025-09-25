import { api, assureForeignKeys } from '../../../lib/server/api'

assureForeignKeys();

export const { GET, POST, PUT, DELETE } = api
