#!/usr/bin/env bash
# Set the PCM volume to 90% (front left and front right) on every sound card.

set -u

VOLUME="90%"

# Card lines in /proc/asound/cards look like: " 3 [Device         ]: USB-Audio - USB Audio Device"
cards=$(awk '/^ *[0-9]+ \[/ { print $1 }' /proc/asound/cards)

if [[ -z "$cards" ]]; then
    echo "No sound card found." >&2
    exit 1
fi

for card in $cards; do
    name=$(awk -v c="$card" '$1 == c { sub(/^[^:]*: /, ""); print; exit }' /proc/asound/cards)
    echo "=== Card $card: $name"

    controls=$(amixer -c "$card" scontrols 2>/dev/null)
    echo "$controls"

    if ! grep -q "'PCM',0" <<< "$controls"; then
        echo "--> No PCM control, skipped."
        echo
        continue
    fi

    if amixer -c "$card" get PCM | grep -q "Front Left"; then
        # Stereo (or more): only touch front left and front right.
        amixer -q -c "$card" set PCM front "$VOLUME"
    else
        # Mono control: there are no front left/right channels.
        amixer -q -c "$card" set PCM "$VOLUME"
    fi

    echo "--> PCM set to $VOLUME:"
    amixer -c "$card" get PCM | grep -E "^ +(Front|Mono)"
    echo
done
