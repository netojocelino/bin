#!/bin/sh

PORT=${PORT:-80}

php -S "localhost:${PORT}" -t public
