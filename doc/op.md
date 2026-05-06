% op(1) Version $VERSION | local command shortcuts
% Danny Ben Shitrit \<https://github.com/dannyben\>
% $DATE

NAME
==================================================

**op** - local command shortcuts

SYNOPSIS
==================================================

**op** CODE [ARGS]  
**op** [OPTIONS]

DESCRIPTION
==================================================

**opcode** lets you define a simple configuration file in any directory.

This file includes command shortcuts (*opcodes*) that can be executed by
running **op CODE**.

OPTIONS
==================================================

## ?, --info, -i
Show all codes and their usage comments (#?)

## --list, -l
List command codes

## --show, -s
Show the config file (op.conf)

## --what, -w [CODE]
Show the command for a given code

## --edit, -e
Open the config file for editing

## --add, -a CODE COMMAND...
Append a command to the config file

## --config, -c FILE CODE [ARGS]
Use a specific config file

## --syntax
Show config file syntax

## --help, -h
Show help message

## --version, -v
Show version number

OPCODE FILE
==================================================

Running **op** will look for a file named **opcode** or **op.conf** in the
working directory.

The syntax of this file is simple - each line should contain a code and the
command to run:

```shell
code: command to run
```

For example:

```shell
commit: git commit -am "quick commit"
```

With this configuration, you can now simply run:

```shell
$ op commit
```

Any argument provided to the CLI will be forwarded to the command, so with 
this configuration:

```shell
commit: git commit -am "$@"
```

You can supply a commit message:

```shell
$ op commit "my commit message"
```

### Config Selection

Use `-c, --config` or `OPCODE_CONFIG` to run commands from a specific config
file:

```shell
$ op -c agent.op.conf check
$ op --config agent.op.conf check
$ OPCODE_CONFIG=agent.op.conf op check
```

The `-c, --config` flag must appear before the command code. Any `-c` that
appears after the command code is passed through to the command as an argument.
The flag has precedence over `OPCODE_CONFIG`.

You can also create another local command namespace by symlinking `op` under a
different name:

```shell
$ cd /usr/local/bin  # or wherever op is installed
$ sudo ln -s op agent
$ agent check
```

A renamed executable uses its own config files:

```text
agent -> agent.op.conf, agent.conf
```

The `.op.conf` file is preferred when both files exist. A renamed executable
does not fall back to `opcode` or `op.conf`; this keeps separately named
catalogs from accidentally running commands from the main `op` namespace.

### Multiline Commands

In order to specify multiple commands for a single code, provide the commands
indented with one or more spaces immediately under the command code:

```shell
up:
  docker compose build
  docker compose up web
```

The commands will be joined together using a newline, as they appear in your
file.

### Positional Arguments

Any excess argument provided when running `op CODE` will be available to you
as they normally would in a bash script. You can access all of them by using
`$@`, or the individual arguments at `$1`, `$2` etc.

Given this configuration:

```shell
deploy: git commit -am "$1" && git push
```

You can now run:

```shell
$ op deploy "version 1.1.1"
```

and it will be translated to this command

```shell
git commit -am "version 1.1.1" && git push
```


### Usage Comments

You may add special usage comments in your `op.conf` file. These will be
displayed alongside their command code when running `op ?`.  The usage comments
must start with `#?` and be placed underneath their associated command. 

For example, this configuration file:

```shell
# op.conf
deploy: git commit -am "$1" && git push
#? perform git commit and push.
#? usage: op deploy COMMIT_MESSAGE

pull: git pull
#? perform git pull
```

will result in this output:

```shell
$ op ?
Usage: op COMMAND [ARGS]
  deploy
    perform git commit and push.
    usage: op deploy COMMIT_MESSAGE

  pull
    perform git pull
```

### Section Comments

Any comment that starts with `##` will be considered a section header, and will
be displayed as such when running `op ?`.

For example, this configuration file:

```shell
# op.conf

## Testing Commands

test: rspec "$@"
#? Run tests

## Git Commands

pull: git pull
#? Perform git pull
```

will result in this output:

```
$ op ?
Usage: op COMMAND [ARGS]

Testing Commands

  test
    Run tests

Git Commands

  pull
    Perform git pull
```



### Private Commands

Using the keyword `private` in a separate line anywhere in your `op.conf` file
will hide all subsequent commands from `op ?` and `op --list`. The private
commands can still be executed.

```shell
deploy: op clean && op build
test: docker compose run test

private

clean: rm tmp/*
build: docker build

```

PARTIAL COMMAND MATCHING
==================================================

When running a command, opcode will first try to find an exact match. If none
is found, it will try to find a command that starts with the code you typed.

In other words, if you have this in your `op.conf` file:

```shell
server: echo "Running Server" && rackup
```

You can run it with **op server**, **op s** and anything in between. The first 
matched command will be executed.


BASH COMPLETION
==================================================

Opcode comes with bash completion. If you install opcode using the setup script,
bash completion will be installed automatically.

If you install opcode manually, and would like to enable bash completion, 
simply add this to your `~/.bashrc`:

```shell
complete -C 'op --completion' op
```

For a renamed executable, install completion with the same name:

```shell
complete -C 'agent --completion' agent
```

SOURCE CODE
==================================================

https://github.com/dannyben/opcode

ISSUE TRACKER
==================================================

https://github.com/dannyben/opcode/issues
