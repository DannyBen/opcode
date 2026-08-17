---
name: opcode
description: Use when working with Opcode command catalogs such as op.conf or agent.op.conf; edit and run user-controlled op commands, and maintain agent-owned reusable commands only when the local agent executable is an Opcode alias.
metadata:
  short-description: Manage Opcode command catalogs
---

# Opcode

Opcode is a repo-local command catalog. Treat it as a lightweight makefile:
small named commands live in a config file, then run as `op CODE [ARGS]` or,
for a named catalog, `<name> CODE [ARGS]`.

## User-Controlled `op.conf`

Use this path when the user asks to add, edit, inspect, or run commands in the
project's normal Opcode catalog.

1. Read the existing `op.conf` before editing it. If the user asks for an
   interactive edit, use `op --edit`; if they ask Codex to make the change,
   edit the file directly.
2. Preserve the user's organization and wording. Add only the requested command
   or the smallest useful helper around it.
3. Use normal Opcode syntax:

   ```shell
   code: command to run

   multi:
     first command
     second command
   #? usage text shown by op ?

   greet: echo "hello ${2:-Mr.} $1"
   #? Say hello
   #$ NAME [TITLE]
   ```

   Arguments declared on a `#$` line are included in `op ?`. Bare names are
   required, while names in brackets are optional. The command continues to
   access them positionally through `$1`, `$2`, and `$@`.

4. Run commands through Opcode when that is what the user asked for:

   ```shell
   op CODE
   op CODE ARG1 ARG2
   op --show
   op --edit
   op --add CODE COMMAND...
   op ?
   op --syntax
   ```

5. Remember that `op.conf` is user-controlled. Do not fill it with agent-only
   workarounds unless the user asks for that.

## Agent Mode

Use this path only when the `agent` command is available and is actually an
Opcode alias.

Check both conditions:

```shell
command -v agent
agent -h 2>/dev/null | head -n1
```

The first command must find `agent`, and the first help line must contain
`opcode`. If either check fails, do not create or rely on `agent.op.conf`; keep
using normal repo commands or ask the user before setting up an alias.

When agent mode is available, prefer a repo-local `agent.op.conf` for commands
that help agents succeed on the first run. This is for repeatable environment
setup, sandbox-safe validation, fixture commands, or common flags that agents
would otherwise rediscover after a failed attempt.

When creating `agent.op.conf`, start it with this header:

```shell
# agent opcode (https://github.com/dannyben/opcode)
```

Then add focused commands, for example:

```shell
# agent opcode (https://github.com/dannyben/opcode)

test:
  GOCACHE=/tmp/example-go-cache go test ./...
#? Run the agent-safe test command
```

Agent-mode rules:

- Keep `agent.op.conf` separate from the user's `op.conf`.
- Prefer short reusable names such as `agent test`, `agent check`, or
  `agent build`.
- Encode recurring environment variables, config flags, or local setup in the
  command instead of rerunning a failing raw command and then correcting it.
- Do not add one-off exploratory commands that are unlikely to be reused.
- After adding a command, run it via `agent CODE` when practical.

## Config Discovery

Canonical `op` looks for:

```text
opcode, then op.conf
```

A renamed executable such as `agent` looks for:

```text
agent.op.conf, then agent.conf
```

Renamed executables do not fall back to `opcode` or `op.conf`. Use
`op --syntax` or `agent --syntax` for the current syntax summary.
