# squery [![](https://img.shields.io/npm/v/squery.svg)](https://www.npmjs.org/package/squery) [![](http://img.shields.io/david/silverwind/squery.svg)](https://david-dm.org/silverwind/squery) [![](http://img.shields.io/npm/dm/squery.svg)](https://www.npmjs.org/package/squery)
> Yet another jQuery "replacement"

`squery` is based on the awesome [bling.js](https://gist.github.com/paulirish/12fb951a8b893a454b32) and brings the following extensions:

- `.off` support. Even without a listener.
- `.on` and `.off` support multiple space-separated event names.
- `$('a')` returns a `Node` when only one element is matched, otherwise a `NodeList`.
- `$.ajax`, fully promise-based.

`squery` currently weights 494 bytes gzipped.

# Install
```
npm i --save squery
```

# Examples
````js
// working on a single element
$('#id').classList.add('newclass');
$('#id').style.backgroundColor = 'red';
$('#id').on('click focus', /* … */);
$('#id').off('click focus');

// working on multiple elements
$('a').forEach((el) => {
  el.style.color = 'red';
});
$('a').on('click focus', handler);
$('a').off('click focus', handler);

// ajax
$.ajax('url').then(xhr => {
  console.log(xhr.response);
});
$.ajax({
  method: 'POST',
  url: 'url',
  responseType: 'json'
  data: JSON.stringify({x:1});
}.then(xhr => {
  console.log(xhr.response);
}).catch(xhr => {
  /* … */
});
````
# TODO:
- JSON support for `$.ajax`.
- `.addClass` and `.removeClass`: Debatable because `classList` is pretty easy to use.

© [silverwind](https://github.com/silverwind), distributed under BSD licence
