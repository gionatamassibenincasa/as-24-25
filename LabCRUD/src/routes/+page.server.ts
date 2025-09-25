// import { lucia } from "$lib/server/auth";
import { fail, redirect } from "@sveltejs/kit";
import type { Actions, PageServerLoad } from "./$types";
import { remult } from 'remult'
import { repo } from 'remult'
import { Utente } from "$lib/shared/entities/Utente";
import { RuoloUtente } from "$lib/shared/entities/RuoloUtente";
import { Ruolo } from "$lib/shared/entities/Ruolo";



export const load: PageServerLoad = async (event) => {
	if (!remult.authenticated()) {
		throw redirect(303, '/auth/signin')
	}
	const utenti = await repo(Utente).find({
	});

	const ruoli = await repo(Ruolo).find({
		include:
		{
			Utente: {
				id: true
			}
		}
	})

	const str = JSON.stringify(utenti, null, 2);
	console.log(utenti);
	console.log(ruoli);
	return {
		user: remult.user,
		utenti: str
	}
};

// export const actions: Actions = {
// 	default: async (event) => {
// 		if (!event.locals.session) {
// 			return fail(401);
// 		}
// 		await lucia.invalidateSession(event.locals.session.id);
// 		const sessionCookie = lucia.createBlankSessionCookie();
// 		event.cookies.set(sessionCookie.name, sessionCookie.value, {
// 			path: ".",
// 			...sessionCookie.attributes
// 		});
// 		return redirect(302, "/auth/signin");
// 	}
// };