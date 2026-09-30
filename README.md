# windoku.koplugin

A Windoku (Windows Sudoku) plugin for [KOReader](https://github.com/koreader/koreader).

## Screenshot

![Screenshot](images/windoku.png)

## Rules

Standard 9×9 Sudoku rules plus four extra "window" 3×3 regions (one highlighted in each quadrant of the grid) that must also each contain every digit 1–9 exactly once.

## Features

- **Four difficulty levels** — Easy, Medium, Hard and Expert, each guaranteeing the grid is solvable by pure deduction with no guessing
- **Window shading** — the four extra regions are visually highlighted
- **Note mode** — pencil in candidate digits
- **Check** — highlights incorrect cells
- **Hint** — reveals the next deduction in three taps: where to look, which technique and digit, then the value itself
- **Reveal solution** — shows the full solution
- **Undo** — step back through your moves
- **Auto-save** — game state saved and restored on next launch

## Installation

1. Download `windoku.koplugin.zip` from the [latest release](../../releases/latest).
2. Extract into the `plugins/` folder of your KOReader data directory.
3. Restart KOReader.
4. Open the menu → **Tools** → **Windoku**.

## Controls

| Action | How |
|--------|-----|
| Select a cell | Tap it |
| Enter a digit | Tap the digit button |
| Erase a cell | Tap **Erase** |
| Toggle note mode | Tap **Note: Off / On** |
| Undo last move | Tap **Undo** |
| Check progress | Tap **Check** |
| Get a hint | Tap **Hint** (tap again to go deeper) |
| New game | Tap **New game** |
| Change difficulty | Tap **Diff** |
| Show rules | Tap **Rules** |

## License

GPL-3.0 — see [LICENSE](LICENSE).
