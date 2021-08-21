# dumb-pallete.vim
Simple and dumb command pallete for vim

## Installation
```vim
Plug 'filipelinhares/dumb-pallete.vim'
```

## Configuration
```
let dumb_commands = [
      \ {'text': 'Prettier', 'command': 'PrettierAsync' },
      \ {'text': 'Logando', 'func': 'Logando' },
      \ {'text': 'Package Install', 'command': 'PlugInstall' },
      \ ]
```

## Commands

```
:DumbOpen
:DumbClose
```

## Help
```
:help dumb-pallete
```

## License
[MIT](LICENSE.md) © Filipe Linhares
