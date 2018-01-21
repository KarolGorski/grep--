#!/bin/bash


function return_lines_matching_regex() {
	
	file=$1
	pattern=$2
	
	sed_pattern='/'$pattern'/p'
	cat $file | sed -nr $sed_pattern
	
}

#return_lines_matching_regex file.txt "a?a"



function find_and_replace_in_file() {
	file=$1
	pattern=$2
	replacement_string=$3
	
	sed_pattern='s/'$pattern'/'$replacement_string'/g'
	sed -i $sed_pattern $file	

}

#cp file.txt file2.txt
#find_and_replace file2.txt "\b[[:alnum:]]\{4\}\b" "XXXX"
#cat file2.txt


function delete_lines_that_match_from_file() {
	file=$1
	pattern=$2
	
	sed_pattern='/'$pattern'/d'
	sed -i $sed_pattern $file	
	#cat $file  | sed -n $sed_pattern | cat
}

#cp file.txt file2.txt
#delete_lines_that_match_from_file file2.txt "\b[[:alnum:]]\{4\}\b" "XXXX"
#cat file2.txt
