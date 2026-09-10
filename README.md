# Cruscotto della doppia dipendenza — pagina web

`index.html` è il cruscotto di monitoraggio proposto nella sezione 5 del rapporto *La doppia dipendenza* (settembre 2026): 20 indicatori in 6 aree, soglie di attenzione, i cinque segnali che distinguono gli scenari al 2030 e tre grafici con vista tabella. È un unico file HTML senza dipendenze (i grafici sono SVG generati in pagina): si apre anche in locale con un doppio clic.

## Aggiornare i valori

Tutti i dati sono nel blocco `DATI` in testa allo `<script>` di `index.html`:

- `AREAS` → gli indicatori (`v` valore mostrato, `soglia`, `st` stato: `crit` oltre soglia · `warn` al limite · `good` sotto soglia · `nd` non disponibile, `src`, `freq`, `when`).
- `SIGNALS` → i cinque segnali di scenario (`to`: `"A"|"B"|"C"|"wait"|"nd"`).
- `STOCK`, `IMPORT`, `FER` → le serie dei tre grafici.
- `DATA_DATE` → la data di aggiornamento in testata (cambiarla anche nell'HTML dell'header).

I contatori della "Lettura d'insieme" si ricalcolano da soli dagli stati.

## Come è pubblicato (assetto scelto: vault privato + cruscotto pubblico)

Due repository su GitHub, collegati al vault come remoti:

| Remoto | Repository | Contenuto | Visibilità |
|---|---|---|---|
| `origin` | `NikolaTesla86/second-brain` | tutto il vault | privato |
| `pages` | `NikolaTesla86/second-brain-cruscotto` | **solo** questa cartella `docs/` | pubblico → GitHub Pages |

La cartella `docs/` viene copiata nel repository pubblico con `git subtree`, quindi il vault resta l'unica sorgente: si modifica qui, si committa, si pubblica.

Sito: **https://nikolatesla86.github.io/second-brain-cruscotto/** (Pages attivato su `second-brain-cruscotto` → Settings → Pages → Deploy from a branch → `main` / `/ (root)`).

## Aggiornare il cruscotto online

1. Modifica `docs/index.html` (blocco `DATI`), poi:
   ```bash
   git add docs && git commit -m "Cruscotto: aggiornamento dati <data>"
   ```
2. Pubblica (spinge il vault sul privato e `docs/` sul pubblico):
   ```bash
   sh docs/publish.sh
   ```
Dopo circa un minuto il sito è aggiornato.

L'autenticazione con GitHub avviene con la chiave SSH del Mac (`~/.ssh/id_ed25519`), registrata nell'account: non servono password o token.
