# dumb-palette.vim ![version](https://img.shields.io/github/v/tag/filipelinhares/dumb-pallete.vim?color=gray&label=version)
Simple and dumb command palette for Vim

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

## Screen
<p align="center">
  <img src="https://i.imgur.com/GSJzKtM.gif" />
</p>

## License
[MIT](LICENSE.md) © Filipe Linhares
