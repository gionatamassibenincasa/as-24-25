<script lang="ts">
	import MoonIcon from '@lucide/svelte/icons/moon';
	import SunIcon from '@lucide/svelte/icons/sun';
	import { route } from './ROUTES';
	import type { PageData } from './$types';
	import { remult } from 'remult';
	import { removeListener } from 'process';

	let data: PageData = $props();

	let mode = $state('light');

	function toggleMode() {
		mode = mode === 'light' ? 'dark' : 'light';
		const htmlEl = document.documentElement;
		htmlEl.setAttribute('data-theme', mode);
	}

	interface IMyRoutes {
		route: string;
		text: string;
	}

	const myRoutes: IMyRoutes[] = [
		{ route: route('/'), text: 'Home' },
		{ route: route('/ordinamento'), text: 'Ordinamenti' }
		// { path: '/indirizzo', testo: 'Indirizzi' },
		// { path: '/devhelp', testo: 'Aiuto' },
	];
</script>

<header class="container">
	<div>
		<div>
			<h1>Per la scuola! &mdash; Laboratori innovativi</h1>
		</div>
	</div>

	<navbar>
		<nav>
			<ul>
				{#each myRoutes as r}
					<li>
						<a href={r.route}>{r.text}</a>
					</li>
				{/each}
			</ul>
			<ul>
				{#if remult.user?.roles?.includes('admin')}
					<li>
						<a href="/api/admin">Admin</a>
					</li>
				{/if}
				{#if remult.user}
					<li>
						<a href="/auth/signout">Signout</a>
					</li>
				{/if}
			</ul>
			<ul>
				<li>
					<button onclick={toggleMode}>
						{#if mode === 'light'}
							<MoonIcon />
						{:else}
							<SunIcon />
						{/if}
					</button>
				</li>
			</ul>
		</nav>
	</navbar>
</header>
