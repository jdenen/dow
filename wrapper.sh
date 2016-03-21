#!/bin/bash

set -e

DOWDIR="`dirname \"$0\"`"
exec "$DOWDIR/lib/ruby/bin/ruby" "$DOWDIR/lib/dow/cli.rb" "$@"
