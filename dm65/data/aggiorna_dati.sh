#!/bin/env sh

rm -f calendario_corsi.sqlite
sqlite3 calendario_corsi.sqlite < calendario_corsi.sql

echo "Ho inserito delle lezioni in giorni festivi?"
echo "SELECT * FROM LezioniInGiorniFestivi" | sqlite3 calendario_corsi.sqlite  

echo "Ho dimenticato di pianificare qualche lezione?"
echo "SELECT * FROM EdizioniIncomplete" |  sqlite3 calendario_corsi.sqlite  

echo "Il personale è impegnato conteporaneamente in più corsi?"
echo "SELECT * FROM SovrapposizionePersonale" | sqlite3 calendario_corsi.sqlite

echo "VACUUM;" | sqlite3 calendario_corsi.sqlite


# sqlitebrowser calendario_corsi.sqlite
