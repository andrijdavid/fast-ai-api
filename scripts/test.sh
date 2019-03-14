#!/usr/bin/env bash
set -e

docker-compose -f --parallel docker-compose.build.yml build