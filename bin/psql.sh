#!/bin/bash

psql --host localhost --dbname pnud --user pnud "${1:+--command=$*}"

