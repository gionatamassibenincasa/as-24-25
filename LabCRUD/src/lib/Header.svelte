<script lang="ts">
	import SunIcon from '@lucide/svelte/icons/sun';
	import MoonIcon from '@lucide/svelte/icons/moon';

	let mode = $state('light');

	function toggleMode() {
		mode = mode === 'light' ? 'dark' : 'light';
		const htmlEl = document.documentElement;
		htmlEl.setAttribute('data-theme', mode);
	}

	interface Rotte {
		path: string;
		testo: string;
	}

	const rotte: Rotte[] = [
		{ path: '/', testo: 'Home' },
		{ path: '/ordinamento', testo: 'Ordinamenti' },
		{ path: '/indirizzo', testo: 'Indirizzi' },
		{ path: '/devhelp', testo: 'Aiuto' }
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
				{#each rotte as r}
					<li>
						<a href={r.path}>{r.testo}</a>
					</li>
				{/each}
			</ul>
			<ul>
				<li>
					<a href="/api/admin">Admin</a>
				</li>
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
