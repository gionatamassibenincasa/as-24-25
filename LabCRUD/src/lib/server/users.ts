import { type UserInfo, repo, withRemult } from 'remult'
import { Utente } from '$lib/shared/entities/Utente'
import { Ruolo } from '$lib/shared/entities/Ruolo'
import { RuoloUtente } from '$lib/shared/entities/RuoloUtente'


export async function getUsersFromDatabase(): Promise<UserInfo[]> {
    return await withRemult(async () => {
        const usersRepo = repo(Utente);

        const utenti = await usersRepo.find({
            include: {
                RuoloUtente: {
                    include: {
                        ruoloIdRuolo: true
                    }
                }
            }
        });

        // Transform the fetched users into the UserInfo format required by SvelteKitAuth
        const validUsers = utenti.map((utente) => {
            return {
                id: utente.id,
                name: utente.username,
                roles: utente.RuoloUtente.map((ruoloUtente) => ruoloUtente.ruoloIdRuolo.ruolo),
                password_hash: utente.password_hash
            };
        });

        return validUsers;
    });
}

export async function verifyPassword(name: string, password: string): Promise<boolean> {
    return withRemult(async () => {
        const usersRepo = repo(Utente);
        const user = await usersRepo.findOne({ where: { username: name } });
        if (!user) {
            return false;
        }
        return await Bun.password.verify(password, user.password_hash);
    });
}
export async function getUserByName(name: string): Promise<UserInfo> {
    return await withRemult(async () => {
        const usersRepo = repo(Utente);

        const utente = await usersRepo.findFirst({
            where: {
                username: name
            },
            include: {
                RuoloUtente: {
                    include: {
                        ruoloIdRuolo: true
                    }
                }
            }
        });

        // Transform the fetched users into the UserInfo format required by SvelteKitAuth
        const user =  {
                id: utente.id,
                name: utente.username,
                roles: utente.RuoloUtente.map((ruoloUtente) => ruoloUtente.ruoloIdRuolo.ruolo),
                password_hash: utente.password_hash
            };

        return user;
    });
}
