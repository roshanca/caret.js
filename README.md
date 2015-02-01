# caret.js
>	Get or set caret position, at where you can also insert text.

## Usage

### API

```js
var inputor = document.getElementsByTagName('textarea')[0];
var caret = new Caret('inputor');
```

### getPos

Get current caret position, return {start, end, text}:

```js
caret.getPos();
```

### setPos

Set current caret position:

```js
caret.setPos({start: 1, end: 4});
```

### insert

Insert text at given postion:

```js
carent.insert({start: 1, end: 4}, 'text');
```

## Compatibility

### Element

Works fine both for `textarea` and `input` element.

### Browser

All modern browser and IE5+

## License

MIT license (© 2015 Roshan Wu)