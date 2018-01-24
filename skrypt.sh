#!/bin/bash

#argcount=$@
#wzorzec=$(($argcount-1))
#sciezka=$(($argcount-1))

wzorzec="${@: -1}"
sciezka="${@: -2:1}"


function manual(){
	echo "Hi there :)
So, you want to use Grep--. 
Not wisely, my Padawan. 
You can use our app to search for regex in file/s. 
Kinda smart, don't you think?

Fundamental use: grep-- <flags> <file to search> <regex ( w jakiej formie ? )>

 Flags
 -c 		- grep-- will color result
 -h 		- manual (yes, this manual :v)
 -i 		- grep-- will ignore size of letters
 -l <file> 	- grep-- will TAKE REGEXES FROM file and check'em all
 -R <new regex> - grep-- will replace regex which it finds for new regex
 -r 		- grep-- will delete lines with given regex

grep-- works recursively at default. You specify on your own if u want to search in file ( just give him path to file ) or path (path to some folder ) to search for lines which containts your regex.

grep-- works in 3 different modes:
	-searching ( no flag, just fundamental use ). You can add flags:
		-c
		-i
		-l 
	-replacing regex by new regex. You can add flags:
		-i
		-l
	-deleting regex. You can add flags:
		-i
		-l"
exit 1
}

function return_lines_matching_regex() {
	
	
	file=$1
	pattern=$2
	
	sed_pattern='/'$pattern'/p'
	cat $file | sed -nr $sed_pattern

}

function find_and_replace_in_file() {
	file=$1
	pattern=$2
	replacement_string=$3
	
	sed_pattern='s/'$pattern'/'$replacement_string'/g'
	sed -i $sed_pattern $file	

}

function delete_lines_that_match_from_file() {
	file=$1
	pattern=$2
	
	sed_pattern='/'$pattern'/d'
	sed -i $sed_pattern $file	
	#cat $file  | sed -n $sed_pattern | cat
}

function color() {
	echo "NO CO KURDE"
}


if [ $# -eq 0 ]; then
	manual
fi

kolor=0
casesensitivity=0
fromlist=0
replace=0
remove=0


while getopts "richRl" opt; do
	case $opt in
	h)	
		#echo "You've chosen our help"
		manual
		exit 1
		;;
	c)
		kolor=1
		echo "mam flage c - kolorowanie wyniku"
		;;
	i)
		casesensitivity=1
		#echo "Ignorowanie wielkości znaków"
		;;
	l)	
		fromlist=1
		#echo "Pobieranie wzorców z pliku"
		;;
	R)	
		replace=1
		#echo "Zamiana regexa"
		;;
	r)
		remove=1
		#echo "Usuwanie lini pasujących do wzorca"
		;;
	esac
done

if [ $kolor -eq 1 ] && [ $replace -eq 1 ]; then
	echo "Not allowed flags use, better see option -h for some help"
	exit 1;
elif [ "$remove" == "$replace" ] && [ "$replace" == "1" ];then
	echo "Not allowed flags use, better see option -h for some help"
	exit 1;
elif [ "$kolor" == "$remove" ] && [ "$remove" == "1" ];then
	echo "Not allowed flags use, better see option -h for some help"
	exit 1;
fi


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
            done
        fi

        i=$((i+1))
    done
}



#Dzialanie
if [ $remove -eq 0 ] && [ $replace -eq 0 ]; then
	echo "Fundamental use:"
	if [ $kolor -eq 1 ]
		return_lines_matching_regex $sciezka $wzorzec
	
fi


