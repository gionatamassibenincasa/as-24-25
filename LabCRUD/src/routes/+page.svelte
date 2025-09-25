<script lang="ts">
	import { enhance } from "$app/forms";
	import type { PageData } from "./$types";

	let data: PageData = $props();

	import { repo } from 'remult';
	import { Utente } from '$lib/shared/entities/Utente';
	import { RuoloUtente } from "$lib/shared/entities/RuoloUtente";
	import { Ruolo } from '$lib/shared/entities/Ruolo';

	import { Relations } from 'remult';
</script>

<!--h1>Hi, {data.user}!</h1>
<p>Your user ID is {data.user.id}.</p>
<form method="post" use:enhance>
	<button>Sign out</button>
</form-->

<pre>
    <code>
        {JSON.stringify(data, null, 2)}
    </code>
</pre>