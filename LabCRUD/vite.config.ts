import { sveltekit } from '@sveltejs/kit/vite'
import { defineConfig } from 'vite'
import devtoolsJson from 'vite-plugin-devtools-json'
import { kitRoutes, type Options } from 'vite-plugin-kit-routes'
import type { KIT_ROUTES } from '$lib/ROUTES'

export const _kitRoutesConfig: Options<KIT_ROUTES> = {
  PAGES: {
  }
}

export default defineConfig({
	plugins: [sveltekit(), devtoolsJson(), kitRoutes()],
})
