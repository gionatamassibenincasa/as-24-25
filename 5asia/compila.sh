#!/usr/bin/env bash

plantuml -tsvg manuale.md
pandoc manuale.md --standalone --metadata title="Manuale d'Informatica - Esame di Stato 2025 - 5A SIA - IIS Savoia Benincasa" --highlight-style my.theme -o manuale.html
