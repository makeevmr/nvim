#!/usr/bin/env bash

set -euo pipefail

case "$(powerprofilesctl get)" in
    power-saver)
        next_profile="balanced"
        ;;
    balanced)
        next_profile="performance"
        ;;
    performance)
        next_profile="power-saver"
        ;;
    *)
        next_profile="balanced"
        ;;
esac

powerprofilesctl set "$next_profile"
