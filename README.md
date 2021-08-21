# dumb-palette.vim
Simple and dumb command palette for vim

## Installation
```vim
Plug 'filipelinhares/dumb-palette.vim'
```

## Configuration
```
let dumb_commands = [
      \ {'text': 'With function', 'func': 'FunctionName' },
      \ {'text': 'Package Install', 'command': 'PlugInstall' },
      \ ]
```

## Mapping

<kbd>`<leader>`</kbd>+<kbd>o</kbd> :DumbOpen

## Commands

```
:DumbOpen
:DumbClose
```

## Help
```
:help dumb-palette
```

## License
[MIT](LICENSE.md) © Filipe Linhares
