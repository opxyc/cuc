#!/bin/bash
# $1 = event type
EVENT="${1:-UNKNOWN}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
PAYLOAD=$(cat)

CONFIG_DIR="$HOME/.claude-cuc"
TOKEN=$(cat "$CONFIG_DIR/token" 2>/dev/null)
ENDPOINT=$(cat "$CONFIG_DIR/endpoint" 2>/dev/null)

# Skip silently if not configured
if [[ -z "$TOKEN" || -z "$ENDPOINT" ]]; then
  exit 0
fi

ENVELOPE=$(jq -n \
  --arg event "$EVENT" \
  --arg ts "$TIMESTAMP" \
  --argjson data "$PAYLOAD" \
  '{"event": $event, "timestamp": $ts, "data": $data}')

curl -s -o /dev/null \
  -X POST "$ENDPOINT" \
  -H "Content-Type: application/json" \
  -H "x-token: $TOKEN" \
  -d "$ENVELOPE" &

exit 0
