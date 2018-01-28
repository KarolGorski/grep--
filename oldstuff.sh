# <old stuff>



if [ $ignoreLetterCase -eq 1 ]; then

	cat $path | sed -nr '/'$pattern'/ip'

	exit 1
fi


if [ $removeMatchingLines -eq 1 ]; then
	delete_lines_that_match_from_file $path
	exit 1;
fi

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
	echo "Uzyty wzorzec: $wzorzec dla lokalizacji: $sciezka
"
	return_lines_matching_regex $sciezka $wzorzec

	if [ $kolor -eq 1 ]; then
		return_lines_matching_regex $sciezka $wzorzec
	fi
	
fi
