#!/bin/bash

function manual(){
	
}

if [ $# -eq 0 ]; then
	manual()
fi

while getopts "richR" opt; do
	case $opt in
	r)
		echo "mam flage r - szukanie rekursywnie"
		;;
	c)
		echo "mam flage c - kolorowanie wyniku"
		;;
	h)	
		echo "Instrukcja obsługi programu"
		;;
	i)
		echo "Ignorowanie wielkości znaków"
		;;
	l)	
		echo "Pobieranie wzorców z linii"
		;;
	R)	echo "Zamiana regexa"
		;;
	x)
		echo "Usuwanie lini pasujących do wzorca"
		;;
	esac
done



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

fundamental $sprawdzane
