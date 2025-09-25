import type { RequestHandler } from './$types';
import { api } from "$lib/server/api";
import { type Response } from '@sveltejs/kit';

export const GET: RequestHandler = async () => {
    const res = JSON.stringify(await api.openApiDoc({ title: "Laboratori per la Scuola" }), null, 2);
    // console.log(JSON.stringify(res, null, 2));
    return new Response(res, {
        headers: {
            'Content-Type': 'application/json',
        }
    });
};