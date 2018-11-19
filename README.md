Opcode - Local Command Shortcuts
==================================================

![Version](https://img.shields.io/badge/version-0.3.0-blue.svg)
[![Build Status](https://travis-ci.com/DannyBen/opcode.svg?branch=master)](https://travis-ci.com/DannyBen/opcode)

---

Opcode lets you define a simple configuration file in any directory.
This file includes shortcuts to other commands.

![Demo](/demo.gif)

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
directory. See the example [op.conf](op.conf) file for reference.

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


Positional Arguments
--------------------------------------------------

In some cases, you may want to use the command line arguments in different
positions in your command. Given this configuration:

    deploy: git commit -am "$1" && git push

You can now run:

    $ op deploy "version 1.1.1"

and it will be translated to this command

    git commit -am "version 1.1.1" && git push

This is made possible due to the fact that any command that contains a `$`
character, will not have the command line arguments (`$@`) appended to it.

Partial Command Matching
--------------------------------------------------

When running a command, opcode will first try to find an exact match. If none
is found, it will try to find a command that starts with the code you typed.

In other words, if you have this in your `op.conf` file:

    server: echo "Running Server" && rackup

You can run it with `op server`, `op s` and anything in between. The first 
matched command will be executed.



Bash Completion
--------------------------------------------------

Opcode comes with bash completion. If you install opcode using the setup 
script, bash completion installation will be offered to you.

If you install opcode manually, and would like to enable bash completion, 
simply add this to your `~/.bashrc`:

    eval $(op --complete)





[alf]: https://github.com/dannyben/alf
