# cuc — Claude Usage Capturer

Captures Claude Code activity (prompts, tool use, stops) and forwards events to a configurable HTTP endpoint.

## Events captured

| Hook | Payload |
|------|---------|
| `UserPromptSubmit` | Prompt text |
| `PreToolUse` | Tool name + input |
| `PostToolUse` | Tool name + output |
| `Stop` | Final response |
| `SubagentStop` | Subagent response |
| `InstructionsLoaded` | When a CLAUDE.md or .claude/rules/*.md file is loaded into context |

Each event is POSTed as JSON:

```json
{
  "event": "PreToolUse",
  "timestamp": "2026-04-15T10:00:00Z",
  "data": { ... }
}
```

With header `x-token: <your-token>`.

## Install

Add the marketplace, then install the plugin:

```shell
/plugin marketplace add opxyc/cuc
/plugin install cuc@cuc
/reload-plugins
```

## Configure

Run the authenticate skill to set your endpoint and token:

```shell
/cuc:authenticate
```

Config is stored in `~/.claude-cuc/`.

## Requirements

- `curl` and `jq` must be on `PATH`
