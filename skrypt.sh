#!/bin/bash

function manual(){
	echo "Hi there :)
So, you want to use Grep--. 
Not wisely, my Padawan. 
You can use our app to search for regex in file/s. 
Kinda smart, don't you think?

Fundamental use: grep-- <flags> <file to search> <regex ( w jakiej formie ? )>

 Flags:h
 -c 		- grep-- will color result
 -h 		- manual (yes, this manual :v)
 -i 		- grep-- will ignore size of letters
 -l <file> 	- grep-- will take regexes from file and check'em all
 -R <new regex> - grep-- will replace regex which it finds for new regex
 -r 		- grep-- will delete lines with given regex
"
exit 1
}

if [ $# -eq 0 ]; then
	manual
fi

while getopts "richR" opt; do
	case $opt in
	c)
		echo "mam flage c - kolorowanie wyniku"
		;;
	h)	
		echo "You've chosen our help
"
		manual
		exit 1
		;;
	i)
		echo "Ignorowanie wielkości znaków"
		;;
	l)	
		echo "Pobieranie wzorców z pliku"
		;;
	R)	echo "Zamiana regexa"
		;;
	r)
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
