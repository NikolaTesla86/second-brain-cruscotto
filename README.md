# Cruscotto della doppia dipendenza — pagina web

`index.html` è il cruscotto di monitoraggio proposto nella sezione 5 del rapporto *La doppia dipendenza* (settembre 2026): 20 indicatori in 6 aree, soglie di attenzione, i cinque segnali che distinguono gli scenari al 2030 e tre grafici con vista tabella. È un unico file HTML senza dipendenze (i grafici sono SVG generati in pagina): si apre anche in locale con un doppio clic.

## Aggiornare i valori

Tutti i dati sono nel blocco `DATI` in testa allo `<script>` di `index.html`:

- `AREAS` → gli indicatori (`v` valore mostrato, `soglia`, `st` stato: `crit` oltre soglia · `warn` al limite · `good` sotto soglia · `nd` non disponibile, `src`, `freq`, `when`).
- `SIGNALS` → i cinque segnali di scenario (`to`: `"A"|"B"|"C"|"wait"|"nd"`).
- `STOCK`, `IMPORT`, `FER` → le serie dei tre grafici.
- `DATA_DATE` → la data di aggiornamento in testata (cambiarla anche nell'HTML dell'header).

I contatori della "Lettura d'insieme" si ricalcolano da soli dagli stati.

## Pubblicare con GitHub Pages (una volta sola)

1. Creare un repository su GitHub (es. `second-brain-energia`) e collegarlo al vault:
   ```bash
   git remote add origin https://github.com/<utente>/<repo>.git
   git push -u origin main
   ```
2. Su GitHub: **Settings → Pages → Build and deployment → Source: "Deploy from a branch"**, branch `main`, cartella **`/docs`**, Save.
3. Dopo un minuto la pagina è online su `https://<utente>.github.io/<repo>/`.

Ogni aggiornamento successivo è un semplice commit + push di `docs/index.html`.

> Nota: il resto del vault (note, ingestion, data lake) resta nel repository ma non viene pubblicato: Pages serve solo la cartella `docs/`. Se il repository deve restare privato, GitHub Pages richiede un piano a pagamento; in alternativa si può pubblicare solo `docs/` in un repository separato pubblico.
