Opcode - Local Command Shortcuts
==================================================

[![Build Status](https://travis-ci.com/DannyBen/opcode.svg?branch=master)](https://travis-ci.com/DannyBen/opcode)

---

Opcode lets you define a simple configuration file in any directory.
This file includes shortcuts to other commands.

For a similar project, but for globally accessible aliases, see [alf][alf].

Install
--------------------------------------------------

The simplest way to install, is to run the installation script:

    $ bash <(curl -s https://raw.githubusercontent.com/DannyBen/opcode/master/setup)

If you prefer to install manually, simply download the [op](/op) file,
place it somewhere in your path, and make it executable.

Usage
--------------------------------------------------

When you execute `op`, Opcode will look for `op.conf` in the current 
directory.

The syntax of `op.conf` is simple:

Each line should contain a code and the command to run:

    code: command to run

For example:

    commit: git commit -am "quick commit"

With this configuration, you can now simply run:

    $ op commit

Any argument provided to the CLI will be forwarded to the command, so with 
this configuration:

    commit: git commit -am

You can supply a commit message:

    $ op commit "my commit message"

Finally, in some cases, you may want to use the command line arguments in
different position in your command. Given this configuration:

    deploy: git commit -am "$1" && git push #

You can now run:

    $ op deploy "version 1.1.1"

and it will be translated to this command

    git commit -am "version 1.1.1" && git push #

The `#` at the end is necessary so that bash ignores the entire arguments 
array, which is always appended at the end.



[alf]: https://github.com/dannyben/alf
