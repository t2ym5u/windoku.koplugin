# Windoku

> **Status: stub — not yet implemented**

## Description

Sudoku variant where four 3×3 'window' regions overlap the grid. Each window must also contain 1–9. Also known as NRC Sudoku.

## Files to create

- `board.lua` — game logic, puzzle generator, serialize/load
- `board_widget.lua` — grid rendering and tap gestures
- `screen.lua` — full-screen layout (buttons + board)
- `main.lua` — PluginBase entry point

## Notes

Shares rules with sudoku.koplugin; extend SudokuBoard base or copy and add variant constraints.
