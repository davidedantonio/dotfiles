# Shortcut Neovim — Riferimento completo

> `leader` = `<Space>`
> Fonti: config personale in `lua/davide/**` + comportamenti nativi di Vim/Neovim rilevanti per quei plugin.

---

## 1. Movimento base (nativo Vim)

| Shortcut              | Descrizione                                                                                             |
| --------------------- | ------------------------------------------------------------------------------------------------------- |
| `h` `j` `k` `l`       | sinistra / giù / su / destra                                                                            |
| `w` / `b`             | parola successiva / precedente (inizio parola)                                                          |
| `e` / `ge`            | fine parola successiva / precedente                                                                     |
| `0` / `^`             | inizio riga (colonna 0) / primo carattere non-blank                                                     |
| `$`                   | fine riga                                                                                               |
| `gg` / `G`            | inizio file / fine file                                                                                 |
| `{n}G` o `:{n}`       | vai alla riga `n`                                                                                       |
| `{` / `}`             | paragrafo precedente / successivo                                                                       |
| `%`                   | salta alla parentesi/tag corrispondente                                                                 |
| `f{char}` / `F{char}` | vai al prossimo/precedente carattere `char` sulla riga                                                  |
| `t{char}` / `T{char}` | vai appena prima del prossimo/precedente carattere `char`                                               |
| `;` / `,`             | ripeti l'ultimo `f/F/t/T` in avanti / indietro                                                          |
| `Ctrl-d` / `Ctrl-u`   | scroll mezza pagina giù / su                                                                            |
| `Ctrl-f` / `Ctrl-b`   | scroll pagina intera giù / su                                                                           |
| `zz` / `zt` / `zb`    | centra / porta in alto / porta in basso la riga corrente                                                |
| `H` / `M` / `L`       | vai in cima / centro / fondo della finestra visibile _(nel tuo config `H`/`L` sono rimappati, vedi §4)_ |

## 2. Movimento personalizzato (dal tuo `keymaps.lua`)

| Shortcut             | Modalità       | Descrizione                                                                 |
| -------------------- | -------------- | --------------------------------------------------------------------------- |
| `j`                  | normal         | rimappato su `gj` — scende di una riga **video** (utile con `wrap` attivo)  |
| `k`                  | normal         | rimappato su `gk` — sale di una riga **video**                              |
| `H`                  | normal, visual | scorre 5 caratteri a sinistra (`5h`)                                        |
| `J`                  | normal, visual | scorre 5 righe giù (`5j`) — **sovrascrive** il default `J` (join righe)     |
| `K`                  | normal, visual | scorre 5 righe su (`5k`) — **sovrascrive** il default `K` (man/help lookup) |
| `L`                  | normal, visual | scorre 5 caratteri a destra (`5l`)                                          |
| `Ctrl-h/j/k/l`       | normal         | sposta il focus tra le finestre/split (sinistra/destra/su/giù)              |
| `Ctrl-Shift-h/j/k/l` | normal         | ridimensiona lo split attivo                                                |

## 3. Selezione (Visual mode, nativo Vim)

| Shortcut     | Descrizione                                                        |
| ------------ | ------------------------------------------------------------------ |
| `v`          | selezione caratteri                                                |
| `V`          | selezione righe intere                                             |
| `Ctrl-v`     | selezione a blocco (colonna)                                       |
| `gv`         | riseleziona l'ultima selezione                                     |
| `o`          | (in visual) salta all'altro estremo della selezione                |
| `Esc` o `kj` | esce dalla selezione _(nel tuo config `kj` = Esc anche in insert)_ |

## 4. Text Objects (nativo Vim — selezionano "dentro"/"attorno")

Si combinano con un operatore (`d`, `c`, `y`, `v`, ...) + `i` (inner) o `a` (around):

| Shortcut              | Descrizione                          |
| --------------------- | ------------------------------------ |
| `iw` / `aw`           | parola / parola + spazio             |
| `is` / `as`           | frase (sentence)                     |
| `ip` / `ap`           | paragrafo                            |
| `i(` `i)` `ib` / `a(` | dentro / attorno a `()`              |
| `i{` `i}` `iB` / `a{` | dentro / attorno a `{}`              |
| `i[` / `a[`           | dentro / attorno a `[]`              |
| `i<` / `a<`           | dentro / attorno a `<>`              |
| `i"` `i'` `` i` ``    | dentro virgolette (senza includerle) |
| `a"` `a'` `` a` ``    | attorno a virgolette (incluse)       |
| `it` / `at`           | dentro / attorno a un tag HTML/JSX   |

**Esempi pratici:** `vi(` seleziona il contenuto delle tonde più vicine · `ci"` cancella e sostituisce dentro virgolette · `da{` elimina blocco `{}` comprese le graffe · `yit` copia il contenuto di un tag.

## 5. Editing / Aggiungere parentesi, virgolette, tag — `nvim-surround`

Mapping di default del plugin (non passano dal leader):

| Shortcut             | Descrizione                                                                                                         |
| -------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `ys{motion}{char}`   | **y**es **s**urround: aggiunge `char` attorno al testo coperto dal motion (es. `ysiw)` circonda la parola con `()`) |
| `yss{char}`          | circonda l'intera riga (es. `yss"`)                                                                                 |
| `S{char}`            | (in **visual mode**) circonda il testo selezionato (es. seleziona con `v`, poi `S)`)                                |
| `ds{char}`           | **d**elete **s**urround: rimuove la coppia (es. `ds)` toglie le tonde)                                              |
| `cs{vecchio}{nuovo}` | **c**hange **s**urround: sostituisce un delimitatore con un altro (es. `cs"'` cambia `"…"` in `'…'`)                |
| `cst{tag}`           | cambia il tag HTML/JSX circostante                                                                                  |
| `dst`                | rimuove il tag HTML/JSX circostante                                                                                 |

> Suggerimenti: `(`/`{`/`[` inseriscono senza spazio interno, `)`/`}`/`]` inseriscono con spazio interno (es. `ysiw(` → `( parola )`, `ysiw)` → `(parola)`).

## 6. Editing / Sostituzione testo — `substitute.nvim`

Rimpiazza il comportamento nativo di `s`/`S`:

| Shortcut    | Modalità | Descrizione                                                                                                                        |
| ----------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `s{motion}` | normal   | sostituisce il testo coperto dal motion con il contenuto del registro (es. `siw` sostituisce la parola con l'ultimo testo copiato) |
| `ss`        | normal   | sostituisce l'intera riga                                                                                                          |
| `S`         | normal   | sostituisce dal cursore a fine riga                                                                                                |
| `s`         | visual   | sostituisce la selezione con il contenuto del registro                                                                             |

## 7. Auto-chiusura parentesi — `mini.pairs`

Non è uno shortcut esplicito ma un comportamento automatico in **insert mode**:

| Azione                       | Descrizione                                             |
| ---------------------------- | ------------------------------------------------------- |
| Digitare `(` `[` `{` `"` `'` | il carattere di chiusura viene inserito automaticamente |
| `Backspace` subito dopo      | elimina l'intera coppia appena creata                   |
| Attivo anche in `cmdline`    | (non nel terminale)                                     |

## 8. Indentazione, copia/incolla e altre modifiche

| Shortcut                           | Modalità | Descrizione                                                         |
| ---------------------------------- | -------- | ------------------------------------------------------------------- |
| `<`                                | visual   | indenta a sinistra e **ri-seleziona** (`<gv`), permette di ripetere |
| `>`                                | visual   | indenta a destra e **ri-seleziona** (`>gv`)                         |
| `Ctrl-c`                           | visual   | copia la selezione sulla clipboard di sistema (`"+y`)               |
| `Ctrl-s`                           | normal   | incolla dalla clipboard di sistema prima del cursore (`"+P`)        |
| `Ctrl-;`                           | insert   | aggiunge `;` a fine riga senza uscire dall'editing                  |
| `gf`                               | normal   | apre il file sotto il cursore; se non esiste lo **crea**            |
| `<leader><leader>S` / `<leader>bs` | normal   | esegue (`:source`) il buffer corrente (utile per config Lua)        |

## 9. Editing nativo Vim (fondamentali, non rimappati)

| Shortcut              | Descrizione                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------- |
| `i` / `I`             | insert prima del cursore / a inizio riga                                                       |
| `a` / `A`             | insert dopo il cursore / a fine riga                                                           |
| `o` / `O`             | nuova riga sotto / sopra e insert                                                              |
| `x` / `X`             | elimina carattere sotto / prima del cursore                                                    |
| `dd`                  | elimina (taglia) la riga                                                                       |
| `yy`                  | copia (yank) la riga                                                                           |
| `p` / `P`             | incolla dopo / prima del cursore                                                               |
| `u` / `Ctrl-r`        | undo / redo                                                                                    |
| `.`                   | ripete l'ultima modifica                                                                       |
| `r{char}`             | sostituisce il carattere sotto il cursore                                                      |
| `cc` / `C`            | cambia l'intera riga / da cursore a fine riga                                                  |
| `~`                   | inverte maiuscola/minuscola del carattere                                                      |
| `J`                   | unisce la riga successiva alla corrente _(nel tuo config è occupato da "scroll giù", vedi §2)_ |
| `/pattern` `?pattern` | ricerca in avanti / indietro                                                                   |
| `n` / `N`             | ripete l'ultima ricerca (stessa direzione / direzione opposta)                                 |
| `:%s/vecchio/nuovo/g` | sostituzione globale nel file                                                                  |
| `q{reg}` ... `q`      | registra una macro nel registro `{reg}`                                                        |
| `@{reg}`              | esegue la macro registrata                                                                     |
| `"{reg}y` / `"{reg}p` | yank / paste su un registro specifico                                                          |

## 10. Buffer

| Shortcut     | Descrizione                             |
| ------------ | --------------------------------------- |
| `Tab`        | buffer successivo                       |
| `Shift-Tab`  | buffer precedente                       |
| `<leader>bn` | nuovo buffer vuoto                      |
| `<leader>bl` | vai all'ultimo buffer                   |
| `<leader>ba` | elimina tutti i buffer                  |
| `<leader>bx` | elimina il buffer corrente (via snacks) |
| `<leader>bo` | elimina tutti gli **altri** buffer      |
| `<leader>bs` | esegue (`:source`) il buffer corrente   |

## 11. Finestre / Split

| Shortcut     | Descrizione                                  |
| ------------ | -------------------------------------------- |
| `<leader>pv` | split verticale                              |
| `<leader>ph` | split orizzontale                            |
| `<leader>pe` | rende gli split di dimensioni uguali         |
| `<leader>px` | chiude lo split corrente                     |
| `<leader>po` | mantiene solo la finestra corrente (`:only`) |

## 12. File / Sessione Neovim

| Shortcut    | Descrizione                 |
| ----------- | --------------------------- |
| `<leader>q` | chiude il file (`:q`)       |
| `<leader>Q` | chiude tutti i file (`:qa`) |
| `<leader>w` | salva il file (`:w`)        |
| `<leader>W` | salva tutti i file (`:wa`)  |
| `<leader>M` | mostra `:messages`          |

## 13. Opzioni / Toggle

| Shortcut     | Descrizione                                |
| ------------ | ------------------------------------------ |
| `<leader>ow` | toggle word-wrap                           |
| `<leader>ol` | toggle linebreak                           |
| `<leader>os` | toggle spell-check                         |
| `<leader>oh` | toggle evidenziazione ricerca (`hlsearch`) |
| `<leader>od` | mostra la working directory corrente       |
| `<leader>oc` | toggle `conceallevel` (0 ↔ 2)              |

## 14. QuickFix

| Shortcut | Descrizione                             |
| -------- | --------------------------------------- |
| `Ctrl-n` | elemento successivo nella quickfix list |
| `Ctrl-p` | elemento precedente nella quickfix list |
| `Ctrl-q` | chiude la finestra quickfix             |

## 15. LSP

| Shortcut     | Descrizione                        |
| ------------ | ---------------------------------- |
| `gd`         | vai alla definizione               |
| `<leader>lk` | hover (mostra documentazione/tipo) |
| `<leader>lt` | vai alla definizione del tipo      |
| `<leader>lr` | mostra tutti i riferimenti         |
| `<leader>lR` | rinomina simbolo                   |
| `<leader>ln` | diagnostica successiva             |
| `<leader>lN` | diagnostica precedente             |

## 16. Diagnostica avanzata — `trouble.nvim`

| Shortcut     | Descrizione                        |
| ------------ | ---------------------------------- |
| `<leader>xw` | diagnostica dell'intero workspace  |
| `<leader>xd` | diagnostica del solo file corrente |
| `<leader>xq` | apre la quickfix list in Trouble   |
| `<leader>xl` | apre la location list in Trouble   |
| `<leader>xt` | apre i TODO in Trouble             |

## 17. Formattazione — `conform.nvim`

| Shortcut     | Modalità       | Descrizione                                                                   |
| ------------ | -------------- | ----------------------------------------------------------------------------- |
| `<leader>Fm` | normal, visual | formatta manualmente il buffer/selezione (oltre al format-on-save automatico) |

## 18. Completamento / Snippet (insert mode) — `blink.cmp` + `luasnip`

| Shortcut            | Descrizione                                          |
| ------------------- | ---------------------------------------------------- |
| `Enter`             | accetta il suggerimento selezionato                  |
| `Ctrl-Space`        | mostra/nasconde il menu + documentazione             |
| `Ctrl-e`            | chiude il menu di completamento                      |
| `↑` / `↓`           | selezione voce precedente / successiva               |
| `Ctrl-p` / `Ctrl-n` | selezione voce precedente / successiva (alternativa) |
| `Ctrl-j`            | salta al prossimo placeholder dello snippet          |
| `Ctrl-k`            | salta al placeholder precedente dello snippet        |
| `Ctrl-b` / `Ctrl-f` | scroll su/giù nella finestra di documentazione       |
| `Ctrl-s`            | mostra/nasconde la signature help                    |

## 19. Ricerca file / testo — Telescope & Snacks Picker

| Shortcut                            | Descrizione                                      |
| ----------------------------------- | ------------------------------------------------ |
| `<leader>ff`                        | trova file nella cwd                             |
| `<leader>fH`                        | trova file partendo dalla home                   |
| `<leader>fD`                        | trova file nei dotfiles                          |
| `<leader>fC`                        | trova file in `~/.config/`                       |
| `<leader>fo`                        | file recenti                                     |
| `<leader>fO`                        | file recenti nella cwd corrente                  |
| `<leader>fr`                        | riprende l'ultimo picker usato                   |
| `<leader>fb`                        | elenco buffer aperti                             |
| `<leader>fg`                        | grep nel progetto                                |
| `<leader>fG`                        | grep nei buffer aperti                           |
| `<leader>fc`                        | grep della parola sotto il cursore               |
| `<leader>fs`                        | (Telescope) cerca stringa nella cwd              |
| `<leader>fw`                        | grep per righe (nel buffer/progetto)             |
| `<leader>ft`                        | trova TODO                                       |
| `<leader>fk`                        | elenco keymap disponibili                        |
| `<leader>fh`                        | apre l'help di Neovim                            |
| **Dentro il picker (insert mode):** |                                                  |
| `Ctrl-j` / `Ctrl-k`                 | risultato successivo / precedente                |
| `Ctrl-q`                            | invia i risultati alla quickfix list (+ Trouble) |
| `Ctrl-t`                            | apre i risultati in Trouble                      |

## 20. File tree — `neo-tree.nvim`

Apertura: `<leader>ee` (toggle) · `<leader>ef` (toggle + rivela il file corrente)

| Shortcut (dentro Neo-tree) | Descrizione                                                                           |
| -------------------------- | ------------------------------------------------------------------------------------- |
| `Space`                    | espande/collassa il nodo                                                              |
| `Enter` / doppio click     | apre il file/cartella                                                                 |
| `Esc`                      | annulla                                                                               |
| `P`                        | anteprima flottante del file                                                          |
| `l`                        | sposta il focus sull'anteprima                                                        |
| `s`                        | apre in split verticale                                                               |
| `S`                        | apre in split orizzontale                                                             |
| `t`                        | apre in nuova tab                                                                     |
| `w`                        | apre scegliendo la finestra (window picker)                                           |
| `C`                        | chiude il nodo                                                                        |
| `z`                        | chiude tutti i nodi                                                                   |
| `Z`                        | espande tutti i nodi                                                                  |
| `a`                        | aggiunge un nuovo file                                                                |
| `A`                        | aggiunge una nuova cartella                                                           |
| `d`                        | elimina                                                                               |
| `r`                        | rinomina                                                                              |
| `y` / `x` / `p`            | copia / taglia / incolla (clipboard interna)                                          |
| `c` / `m`                  | copia / sposta                                                                        |
| `R`                        | aggiorna l'albero                                                                     |
| `?`                        | mostra l'help dei comandi                                                             |
| `<` / `>`                  | sorgente precedente / successiva                                                      |
| `i`                        | mostra dettagli del file                                                              |
| `Backspace`                | risali di una cartella                                                                |
| `.`                        | imposta la cartella come root                                                         |
| `H`                        | mostra/nasconde i file nascosti                                                       |
| `/`                        | fuzzy finder sui file                                                                 |
| `#`                        | fuzzy sorter                                                                          |
| `[g` / `]g`                | file precedente/successivo modificato in git                                          |
| `o` poi `c/d/g/m/n/s/t`    | ordina per: creazione / diagnostica / stato git / modifica / nome / dimensione / tipo |

## 21. Git — `gitsigns.nvim`

| Shortcut     | Descrizione                             |
| ------------ | --------------------------------------- |
| `<leader>gg` | apre il menu opzioni Gitsigns           |
| `<leader>gl` | toggle evidenziazione riga modificata   |
| `<leader>gw` | toggle diff a livello di parola         |
| `<leader>gd` | toggle visualizzazione righe eliminate  |
| `<leader>gh` | anteprima dell'hunk (blocco modificato) |
| `<leader>gp` | vai all'hunk precedente                 |
| `<leader>gn` | vai all'hunk successivo                 |
| `<leader>gr` | aggiorna Gitsigns                       |
| `<leader>gH` | confronta con la history (diff)         |

## 22. Git — `lazygit.nvim`

| Shortcut     | Descrizione                             |
| ------------ | --------------------------------------- |
| `<leader>lg` | apre LazyGit (root del repo)            |
| `<leader>lG` | apre LazyGit filtrato sul file corrente |

## 23. GitHub — `octo.nvim`

| Shortcut     | Descrizione         |
| ------------ | ------------------- |
| `<leader>oi` | elenco Issue        |
| `<leader>op` | elenco Pull Request |
| `<leader>od` | elenco Discussion   |
| `<leader>on` | elenco Notifiche    |
| `<leader>os` | ricerca su GitHub   |

## 24. Sessioni — `auto-session`

| Shortcut     | Descrizione                   |
| ------------ | ----------------------------- |
| `<leader>ss` | salva la sessione corrente    |
| `<leader>sl` | cerca sessioni salvate        |
| `<leader>sd` | elimina una sessione (picker) |
| `<leader>sr` | ripristina una sessione       |
| `<leader>sa` | toggle autosave sessioni      |
| `<leader>sD` | disabilita autosave sessioni  |
| `<leader>sp` | elimina sessioni orfane       |

## 25. Notifiche / Messaggi — `noice.nvim`

| Shortcut     | Descrizione                |
| ------------ | -------------------------- |
| `<leader>nh` | cronologia messaggi        |
| `<leader>nl` | ultimo messaggio           |
| `<leader>na` | tutti i messaggi           |
| `<leader>nd` | chiude i messaggi visibili |
| `<leader>np` | picker messaggi            |

## 26. Snacks (dashboard, zen mode, dim, notifiche)

| Shortcut     | Descrizione                               |
| ------------ | ----------------------------------------- |
| `<leader>cn` | mostra cronologia notifiche               |
| `<leader>cd` | attiva "dim" (attenua codice non a fuoco) |
| `<leader>cD` | disattiva "dim"                           |
| `<leader>cz` | attiva Zen Mode                           |
| `<leader>cg` | apre LazyGit (via Snacks)                 |

## 27. Esecuzione codice — `CodeRunner` (funzione custom)

`<leader>R` — salva ed esegue il file corrente in un terminale split (10 righe). Comando usato in base al filetype:

| Linguaggio   | Comando eseguito        |
| ------------ | ----------------------- |
| JavaScript   | `node %`                |
| TypeScript   | `tsc % && node %:r.js`  |
| C++          | `g++ % -o %:r && ./%:r` |
| C            | `gcc % -o %:r && ./%:r` |
| Lua          | `lua %`                 |
| Python       | `python3 %`             |
| Shell (`sh`) | `bash %`                |

## 28. Terminale

| Shortcut  | Descrizione                                      |
| --------- | ------------------------------------------------ |
| `Esc Esc` | (in modalità terminale) esce in modalità normale |

## 29. LaTeX — `vimtex` (mapping di default del plugin, non personalizzati)

| Shortcut | Descrizione                                           |
| -------- | ----------------------------------------------------- |
| `\ll`    | avvia/aggiorna la compilazione in background          |
| `\lv`    | apre il visualizzatore PDF (Skim, come da tua config) |
| `\lc`    | pulisce i file ausiliari di compilazione              |
| `\le`    | mostra gli errori di compilazione                     |

---

### Note

- Non hai plugin di "expand selection" incrementale (tipo flash.nvim/mini.ai treesitter-based): la selezione si basa sui text object nativi (§4).
- Il gruppo Which-key `<leader>u` ("Undotree") è dichiarato in `whichkey.lua` ma **non risulta nessun plugin Undotree installato** — probabilmente un residuo da configurare o rimuovere.
- `H`, `J`, `K`, `L` in normal/visual mode sono stati rimappati per lo scrolling: se cerchi i comandi nativi (join riga, man-lookup, cima/fondo schermo) tienilo a mente.
