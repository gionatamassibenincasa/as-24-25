<script lang="ts">
	import type { Snippet } from 'svelte';
	import type { LayoutData } from './$types';
	import { remult } from 'remult';

	import '@picocss/pico';
	import '@lucide/svelte';
	import '../app.css';

	import Header from '$lib/Header.svelte';

	let { data, children }: { data: LayoutData; children: Snippet } = $props();

	$effect(() => {
		remult.user = data.user;
	});
</script>

<svelte:head>
	<title>Laboratori "Per la Scuola" - by Gionata Massi</title>
</svelte:head>

<Header />

<main class="container">
	{@render children?.()}
</main>

