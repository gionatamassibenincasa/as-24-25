// src/hooks.server.ts
import type { Handle } from '@sveltejs/kit'
import { sequence } from '@sveltejs/kit/hooks'
import { SvelteKitAuth } from '@auth/sveltekit'
import Credentials from '@auth/sveltekit/providers/credentials'
import { api as handleRemult } from './lib/server/api'
import type { UserInfo } from 'remult'
import { repo } from 'remult';
import { Utente } from './lib/shared/entities/Utente'



/**
 * Users that are allowed to log in.
 */
const validUsers: UserInfo[] = [
	{ id: '1', name: 'g.massi', roles: ['admin'] },
	{ id: '2', name: 'bernacchia', roles: ['user'] },
]

/**
 * Handle authentication with authjs as an example
 * Based on article at https://authjs.dev/reference/sveltekit
 */
const handleAuth = SvelteKitAuth({
	trustHost: true,
	providers: [
		Credentials({
			credentials: {
				name: {
					type: "text",
					label: "Nome utente",
					placeholder: 'g.massi',
				},
				password: {
					type: "password",
					label: "Password",
					placeholder: "********",
				},
			},
			authorize: (info) => {
				return validUsers.find((user) => user.name === info?.name) || null
			},
		}),
	],
	callbacks: {
		session: ({ session, token }) => ({
			...session,
			user: validUsers.find((user) => user.id === token?.sub),
		}),
	},
})

export const handle = sequence(
	// 1. Handle authentication
	handleAuth.handle,
	// 2. Handle remult server side
	handleRemult,
)
