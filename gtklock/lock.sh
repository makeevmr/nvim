#!/bin/sh
set -eu

config_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
export LC_TIME=en_GB.UTF-8

if [ -r "$config_dir/session-info.so" ]; then
	exec gtklock \
		--config "$config_dir/config.ini" \
		--style "$config_dir/style.css" \
		--modules "$config_dir/session-info.so" \
		--background "$config_dir/background_3840x2160.jpg" \
		"$@"
fi

exec gtklock \
	--config "$config_dir/config.ini" \
	--style "$config_dir/style.css" \
	--background "$config_dir/background_3840x2160.jpg" \
	"$@"
