#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    str=$line
    echo $str
    str2=${str// /_}
    echo $str2
    sed "s/NOME_VAR/${str}/" modelo/carta-modelo.svg > carta-modelo-1.svg
	sed 's/DIA_VAR/5/' carta-modelo-1.svg > carta-modelo-2.svg
	sed 's/MES_VAR/fevereiro/' carta-modelo-2.svg > carta-modelo-3.svg
	sed 's/ANO_VAR/2019/' carta-modelo-3.svg > carta-modelo${str2}.svg
	inkscape carta-modelo${str2}.svg --export-pdf=carta-modelo${str2}.pdf
done < "$1"


