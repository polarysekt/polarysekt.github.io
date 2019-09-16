---
layout: post
title: TypeScript
description: "Notes about TypeScript"
author: polarysekt
modified: 2019-09-15
tags: [typescript]
---

# Typescript

## Introduction

Typescript :: [https://www.typescriptlang.org/](https://www.typescriptlang.org/)

Typescript is a handy meta-syntax that can be used to debug syntactical errors, as well as transpile to a supported implementation of JavaScript.

NOTE: This article assumes a basic understanding of project management with `npm` (or `yarn`) and `package.json`. Please refer to the [npm](npm) ( or [yarn](yarn) ) article(s) for more information.

### Synopsis

A brief overview of TypeScript covering installation, initialization, and configuration.

## Installation

Typescript can be invoked via CLI by installing globally or locally.

### Global

Many guides will outline the installation of TypeScript globally:

```sh
$ npm install -g typescript
```
This will install typescript globally such that it can simply be invoked from the command line:

```sh
$ tsc
```
In the absense of a `tsconfig.json` (see below for implementation), the command should output the default help screen for the CLI.

NOTE: In general it is not recommended to give `npm` elevated privileges, so the example above assumes `npm` has been configured to install 'globally' on a per-user basis. Refer to the [npm](npm) article for more information on setting up this behavior.

### Local

While the TypeScript CLI can be installed globally, it will work just fine if installed
per-project:

```sh
$ npm install typescript
```

When TypeScript is installed per-project, unlike when it is installed globally, the `tsc` is not immediately available to the commandline as the installation exists within the per-project `node_modules` folder, not included in the normal search path. However, it can be easily run by adding a simple script to `package.json`:

```json
...
    "scripts": {
        "tsc": "tsc"
    },
...
```

When `npm` `run`s scripts, the `node_modules` folders are included in the search path.

It can now be invoked with `npm run`:

```sh
$ npm run tsc
```

In the absense of a `tsconfig.json` (see below for implementation), the command should output the default help screen for the CLI.

One caveat, however involves the passing of specific arguments to the scripts themselves. By default, any arguments specified on the commandline will be directed to the call to `npm` itself. To specify arguments to the script, preceed the argument list with `--`:

```sh
$ npm run tsc -- -v
```

The output should be the version of TypeScript instead of the default invokation help display.

## Configuration

Assuming TypeScript is installed on a project-level (see above), a default `tsconfig.json` can be generated with:

```sh
$ npm run tsc -- --init
```

NOTE: As stated previously, the additional `--` is passed to `npm` to indicate the arguments are to be passed to the script, and not `npm` itself.

This will emit a heavily commented `tsconfig.json` with many options that can be
toggled by uncommenting the lines (`//`).

### Advanced

While simple projects can be well on their way with the default `tsconfig.json`
in the project root, as the project increases in complexity, it may be desireable
to separate configurations into a folder.

Create a folder called `cfg` and place the `tsconfig.json` there:

```sh
$ mkdir cfg/
$ mv tsconfig.json cfg/
```

The new location can be specified to `tsc` using the `--build` parameter:

```sh
$ npm run tsc -- --build cfg/tsconfig.json
```

#### Multiple Build Environments

Many projects would benefit from multiple build environment configurations.

A simple setup involves three targets, `test`, `dev` and `dist`.

In general, a `test` build will contain configuration for an implemented testing facility,such as `mocha`, a `dev` build will retain comments, leave code expanded, and provide source maps to aid in debugging, while a `dist` build will minify the files for debugging and omit the sourcemaps.

While it is simple enough to create separate `tsconfig.json` files for each
configuration, it becomes quickly apparent that there are common settings to each
that get out of sync when making changes.

Common configurations can be placed in a file `cfg/tsconfig.common.json`.

This configuration can then, in turn, be extended by each of the build configurations:

```json
{
    "extends": "./tsconfig.common"
    ...
}
```

NOTE: the extension `.json` is omitted.

