#!/bin/bash

#sprawdzanie liczby argumentow
if [ "$#" -ne 2 ]; then
    echo "Nieprawidlowa liczba argumentow"
    exit 1
fi




#proponuje najpierw zrobic grepa przyjmujacego 2 stringi i ogarniajacego czy 1 spelnia dany wzorzec podany w drugim stringu
#znaczy
#grep-- mamamamama mama*(nie pamietam skladni grepa ale rozumiecie, chodzi o wszystkie slowa zaczynajace sie na mama)
#zwroci 1
sprawdzane="$1"
wzorzec="$2"

RED='\033[0;31m'
GREEN='\033[0;32m'

function fundamental () {
    i=1
    nazwaPliku=$1
    max=$(cat $nazwaPliku | wc -l)

    while [ $i -le  $max ]
    do
        cmd="sed -n -e $i"
        cmd+="p $nazwaPliku"
        line="$($cmd)"

        #do zrobienia zostaje obsługa regexów elo
        if [[ $line == *"$wzorzec"* ]];
        then
            wordcount=$(echo $line | wc -w)
            k=1
            while [ $k -le  $wordcount ]
            do
                # echo -n "$line" | awk 'BEGIN{ORS=" "}1' '{ print $1 }'
                test="$(echo -n "$line" | cut -d " " -f $k | tr -d $'\n')"
                
                k=$((k+1))
                if [ $test == $wzorzec ];
                then
                    echo -ne "${RED}$test"
                else
                    echo -ne "${GREEN}$test"
                fi

                echo -n " "
            done

            echo -n $'\n'
        fi

        i=$((i+1))
    done
}
#wzorzec pewnie trzeba będzie rozbić na czesci i kompletnie nie wiem o czym teraz pisze ale cos sie pojawilo w mojej glowie
#"nana.mama" mozna na przyklad podzielic na 3 czesci, nana:.:mama i najpierw szukac czy w "sprawdzanym" jest 1 część, potem usuwać ją ze słowa sprawdzanego,
# potem sprawdzać 2 część itd (dobrze zrobić tymczasowa zmienna na sprawdzana i wzorzec)
#jezeli uda sie calkowicie calkowicie usunac oba wyrazy to wzorzec zostal spelniony (inaczej jest w przypadku znaku gwiazdki gdzie dla niego musi byc obsluga osobna)

#o to co jest nizej dobrze byloby rozbic na tablice stringow, wtedy nie usuwa sie wyrazow tylko sprawdzasz czy uda ci sie dojsc do konca tablicy
#a obsluga takiej "gwiazdki" na przyklad bylaby duzo latwiejsza

fundamental $sprawdzane



#echo "$sprawdzane"
#echo "$wzorzec"

#ogolnie to nie wiem czy to ma sens, jestem chory i to taki draft na szybko ktory mi sie w glowie zrobil
