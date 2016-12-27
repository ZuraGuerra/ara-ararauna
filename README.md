# Ararua
A front-end seed with Sass, Handlebars and a Make build system.

## Requirements
+ [asdf](https://github.com/asdf-vm/asdf) (optional)
+ [asdf-nodejs](https://github.com/asdf-vm/asdf-nodejs) (optional)
+ Node.js (6.9.0 recommended)
+ [SassC](http://brewformulas.org/Sassc)
+ [Handlebars](http://handlebarsjs.com/installation.html) (4.0.5 recommended)

## Tasks
Modify the `Makefile` accordingly to your needs. A lot of things can be customized.

+ `make init` Creates the source folder tree. Defaults to:
```
.
├── src                         
│   ├── css           # Sass files
│   ├── deps
│   ├── img
│   ├── js
│     ├── templates   # Handlebars files
└── ...
```
+ `make` Compiles the `.scss` and `.handlebars` files, and copies assets to generate the build. Defaults to this folder tree:
```
.
├── build                         
│   ├── css           # CSS files
│   ├── deps
│   ├── img
│   ├── js
│     ├── templates   # Handlebars files
└── ...
```
+ `make clean` Deletes the build.
+ `make rebuild` Deletes the build and regenerates it.
+ `make copy` Copies assets from selected folders to the build.
+ `make sass` Compiles Sass files to CSS.

## Todo
+ make install
+ make help
+ make handlebars
