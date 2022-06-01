
==========================================
How to contribute
==========================================

Clone the repository and create pull request.


General
============================================

To be written.




Automatic local rendering and browser reload
============================================

Here is a recipe setting this up using *npm* and *Node*.

It will render the manual locally, start a local server and open the manual in
your browser. Whenever you make a change, the rendering is done again and the
browser will automatically reload. A local rendering will take place whenever
you make changes. The result will be served to your to setup up automatic local
rendering and browser reloads.

Prepare:

#. Install `Node`. This will also install `npm`

#. Install some modules globally::

      npm install -g yarn gulp-cli

#. Set up the `./node_modules` using *yarn* and `package.json`::

      yarn install

Use::

   # Find out what's available
   yarn run
   yarn gulp --tasks-simple










