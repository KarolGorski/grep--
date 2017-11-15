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
#wzorzec pewnie trzeba będzie rozbić na czesci i kompletnie nie wiem o czym teraz pisze ale cos sie pojawilo w mojej glowie
#"nana.mama" mozna na przyklad podzielic na 3 czesci, nana:.:mama i najpierw szukac czy w "sprawdzanym" jest 1 część, potem usuwać ją ze słowa sprawdzanego,
# potem sprawdzać 2 część itd (dobrze zrobić tymczasowa zmienna na sprawdzana i wzorzec)
#jezeli uda sie calkowicie calkowicie usunac oba wyrazy to wzorzec zostal spelniony (inaczej jest w przypadku znaku gwiazdki gdzie dla niego musi byc obsluga osobna)

#o to co jest nizej dobrze byloby rozbic na tablice stringow, wtedy nie usuwa sie wyrazow tylko sprawdzasz czy uda ci sie dojsc do konca tablicy
#a obsluga takiej "gwiazdki" na przyklad bylaby duzo latwiejsza
sprawdzanaTmp=sprawdzane
wzorzecTmp=wzorzec


echo "$sprawdzane"
echo "$wzorzec"

#ogolnie to nie wiem czy to ma sens, jestem chory i to taki draft na szybko ktory mi sie w glowie zrobil
