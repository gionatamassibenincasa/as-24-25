<script lang="ts">
    import type { Snippet } from 'svelte';
    import type { LayoutData } from './$types';
	import '@picocss/pico';
	import Header from '$lib/Header.svelte';
	
    let { data, children }: { data: LayoutData, children: Snippet } = $props();
</script>

<Header />

<main class="container">
	{@render children?.()}
</main>
