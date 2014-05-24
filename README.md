crayon
=====

A faster version of [chalk](https://github.com/sindresorhus/chalk) -- a module for adding ANSI terminal colors to your text.

This should do the exact same thing as `chalk` with the same API.

It should be a bit faster because it doesn't create dynamic getters as you go
in the common cases where you are only making a simple call like `.red` or 
chaining one level deep like `.red.bgGreen`.

It also doesn't do an `arguments.slice` and `join` if it doesn't need to, 
in the common case where you are just calling the style function on a 
single string, or 2 or 3 strings.

If you chain styles more than 2 levels deep, it will start using `chalk`'s 
dynamic getters, and if you give more then 3 strings as arguments, it
will start using `arguments.slice`.

Simple usage is the same as `chalk`

## Usage

Chalk comes with an easy to use composable API where you just chain and nest the styles you want. `crayon` supports this API as well.

```js
var crayon = require('crayon');

// style a string
console.log(  crayon.blue('Hello world!')  );

// combine styled and normal strings
console.log(  crayon.blue('Hello'), 'World' + crayon.red('!')  );

// compose multiple styles using the chainable API
console.log(  crayon.blue.bgRed.bold('Hello world!')  );

// nest styles
console.log(  crayon.red('Hello', crayon.underline.bgBlue('world') + '!')  );

// pass in multiple arguments
console.log(  crayon.blue('Hello', 'World!', 'Foo', 'bar', 'biz', 'baz')  );
```

You can also use the 256 color ANSI palette this module. The interface is
slightly different than the way you access the normal colors. An example:
```
var crayon = require('crayon');
console.log(crayon('darkred')("The foreground color is set to dark red here"));
console.log(crayon('goldenrod', 'dodgerblue')("yellow on blue background"));
console.log(crayon('goldenrod', 'dodgerblue', 'inverse', 'underline')("inverted and underlined"));


```

You can pass in any ANSI 256 color code, CSS color name, or CSS hex description of a color. The first argument sets the 


