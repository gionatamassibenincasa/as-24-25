<script lang="ts">
	import laboratori from '$lib/assets/laboratori.json';

	let importoTotale = 0;
	laboratori.laboratoriITE.forEach((laboratorio) => {
		laboratorio.strumenti_hardware.costo_complessivo = laboratorio.strumenti_hardware.reduce((a, b) => a + b.prezzo_unitario, 0);
		importoTotale += laboratorio.strumenti_hardware.costo_complessivo;
		laboratorio.strumenti_software.costo_complessivo = laboratorio.strumenti_software.reduce((a, b) => a + b.prezzo_unitario, 0);
		importoTotale += laboratorio.strumenti_software.costo_complessivo;
		
	});
</script>

<h1>Laboratori</h1>

<h2>Indice</h2>

<nav>
	<ol>
		{#each laboratori.laboratoriITE as laboratorio, indiceLab}
			<li><a href="#laboratorio-{indiceLab}">{indiceLab + 1}. {laboratorio.modulo} - {laboratorio.indirizzo}</a></li>
		{/each}
	</ol>
</nav>

{#each laboratori.laboratoriITE as laboratorio, indiceLab}
	<section>
		<h2 id="laboratorio-{indiceLab}">{indiceLab + 1}. {laboratorio.modulo} - {laboratorio.indirizzo}</h2>

		<article>
			<strong>Area:</strong>
			{laboratorio.area}<br />
			<strong>Target:</strong>
			{laboratorio.target}<br />
			<strong>Aula:</strong>
			{laboratorio.aula}<br />

			<strong>Discipline coinvolte:</strong>
			{laboratorio.discipline}
		</article>

		<article>
			<h3>Descrizione</h3>
			{laboratorio.descrizione}

			<h3>Obiettivi</h3>

			<h4>Obiettivi generali</h4>

			<ul>
				{#each laboratorio.obiettivi_generali as o}
					<li>{o}</li>
				{/each}
			</ul>

			<h4>Obiettivi specifici</h4>
			<ul>
				{#each laboratorio.obiettivi_specifici as o}
					<li>{o}</li>
				{/each}
			</ul>
		</article>

		<article>
			<h2>Forniture di beni e attrezzature</h2>
			<h3>Dispositivi tecnologici</h3>

			<table>
				<thead>
					<tr>
						<th>Tipo</th>
						<th>Quantità</th>
						<th>Specifiche</th>
						<th>Prezzo unitario</th>
						<th>Prezzo totale</th>
					</tr>
				</thead>
				<tbody>
					{#each laboratorio.strumenti_hardware as o}
						<tr>
							<td>{o.tipo}</td>
							<td style="text-align: right;">{o.quantita}</td>
							<td>
								{#if Array.isArray(o.specifiche)}
									<ul>
										{#each o.specifiche as s}
											<li>{@html s}</li>
										{/each}
									</ul>
								{:else}
									{@html o.specifiche}
								{/if}
							</td>
							<td style="text-align: right;">{o.prezzo_unitario} €</td>
							<td style="text-align: right;"><strong>{Math.round(o.prezzo_unitario * o.quantita)} €</strong></td><td style="text-align: right;"></td>
						</tr>
					{/each}
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td style="text-align: right;">{laboratorio.strumenti_hardware.reduce((a, b) => a + parseInt(b.quantita), 0)}</td>
						<td></td>
						<td></td>
						<th style="text-align: right;"
							>{Math.round(laboratorio.strumenti_hardware.reduce(
								(a, b) => a + b.prezzo_unitario * b.quantita,
								0
							))} €</th
						>
					</tr>
				</tfoot>
			</table>

			<h3>Software e licenze</h3>

			<table>
				<thead>
					<tr>
						<th>Tipo</th>
						<th>Quantità</th>
						<th>Specifiche</th>
						<th>Prezzo unitario</th>
						<th>Prezzo totale</th>
					</tr>
				</thead>
				<tbody>
					{#each laboratorio.strumenti_software as o}
						<tr>
							<td>{o.tipo}</td>
							<td style="text-align: right;">{o.quantita}</td>
							<td>
								{#if Array.isArray(o.specifiche)}
									<ul>
										{#each o.specifiche as s}
											<li>{@html s}</li>
										{/each}
									</ul>
								{:else}
									{@html o.specifiche}
								{/if}
							</td>
							<td style="text-align: right;">{o.prezzo_unitario} €</td>
							<td style="text-align: right;"><strong>{o.prezzo_unitario * o.quantita}</strong> €</td>
						</tr>
					{/each}
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td style="text-align: right;">{Math.round(laboratorio.strumenti_software.reduce((a, b) => a + parseInt(b.quantita), 0))}</td>
						<td></td>
						<td></td>
						<th style="text-align: right;"
							>{Math.round(laboratorio.strumenti_software.reduce(
								(a, b) => a + b.prezzo_unitario * b.quantita,
								0
							))} €</th>
					</tr>
				</tfoot>
			</table>
		</article>

		<article>
			<h2>Costo totale</h2>

			Costo totale: <strong>{Math.round(laboratorio.strumenti_hardware.reduce((a, b) => a + b.prezzo_unitario * b.quantita, 0) +
				laboratorio.strumenti_software.reduce((a, b) => a + b.prezzo_unitario * b.quantita, 0))}</strong> € IVA esclusa.
		</article>
	</section>
{/each}

<h2>Riepilogo costi laboratori ITE</h2>

<table>
	<thead>
		<tr>
			<th>N.</th>
			<th>Modulo</th>
			<th>Costo complessivo</th>
		</tr>
	</thead>
	<tbody>
		{#each laboratori.laboratoriITE as l, i}
			<tr>
				<th>{i + 1}</th>
				<td>{l.modulo}</td>
				<td style="text-align: right;"
					><strong>{Math.round(l.strumenti_hardware.reduce((a, b) => a + b.prezzo_unitario * b.quantita, 0) +
						l.strumenti_software.reduce((a, b) => a + b.prezzo_unitario * b.quantita, 0))}</strong> €</td
				>
			</tr>
		{/each}
	</tbody>
	<tfoot>
		<tr>
			<td></td>
			<td></td>
			<th style="text-align: right;">
				<strong>{Math.round(laboratori.laboratoriITE.reduce((a, b) => a + b.strumenti_hardware.reduce((a, b) => a + b.prezzo_unitario * b.quantita, 0) + b.strumenti_software.reduce((a, b) => a + b.prezzo_unitario * b.quantita, 0), 0))}</strong> €
			</th>
		</tr>
	</tfoot>
</table>
