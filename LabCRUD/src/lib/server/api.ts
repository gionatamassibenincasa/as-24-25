import { remultApi } from 'remult/remult-sveltekit'
import { dataProvider, entities } from './config'
import type { UserInfo } from 'remult'

export const api = remultApi({
	dataProvider: dataProvider,
	entities: entities,
	admin: true,
	ensureSchema: true,
	getUser: async (event) => {
		const auth = await event?.locals?.auth()
		return auth?.user as UserInfo
	},
})

export const assureForeignKeys = () => {
	console.log('assureForeignKeys');
	dataProvider.execute('PRAGMA foreign_keys = ON');	
}

// openApi documentation
// export const openApiDocument = await buildOpenApiDoc(api, entities);

// export const openApiDoc = api.openApiDoc({
//   title: 'Laboratori per la Scuola',
// })
