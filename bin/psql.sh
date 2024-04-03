#!/bin/bash

psql --host localhost  --dbname pnud "${1:+--command=$*}"

