# grep--
Bash-based implementation of our totally-new-grep :D Group project for Linux's Fundamentals lessons.
```
Hi there :)
So, you want to use Grep--. 
Not wisely, my Padawan. 
You can use our app to search for regex in file/s. 
Kinda smart, don't you think?

    Basic usage: grep-- <flags> <file to search> <phrase/regex>

<regex/regex> - regex in the form unix 'sed' take in (for more please visit: 
https://www.gnu.org/software/sed/manual/html_node/Regular-Expressions-Overview.html)
		
        
Flags:
    -I	install grep-- on your computer (add to PATH)
	-h	manual
	-c	color results
	-i	ignore letter case (searching for 'Jon Snow' will return the same result as searching 
    for 'JoN sNoW')
	-l 	perform a check for all in file ( you must specify file instead of pattern )
	-R 	replace regex which it finds. grep-- will ask you for word to put in
	-r	remove lines matching given phrase/regex
        
grep-- works recursively by default. If you specify a file, grep-- will treat the file contents as input. 
If you specify a folder, grep-- will be executed for each file in that folder and then for each folder in 
that folder and so on, recursively.
        
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
		-l

```

[ PL ]
program przyjmuje jeden plik tekstowy i wyswietla wszystkie jego wiersze, ktore spelniaja warunek, ze dla danego wiersza istnieje podciag tego wiersza ktory pasuje do zadanego wyrazenia regularnego
    
    przyklad uzycia: grep-- file mama
    
rekurencyjne sprawdzanie wszystkich plikow tekstowych na wystepowanie wzorca
ignorowanie wielkosci znakow
sprawdzanie danego pliku “lista” wzorcow z podanego pliku (1 wiersz to 1 wzorzec) i wypisanie SPRAWDZANY WZORZEC: PASUJACE PODCIAGI
    SPOSOB WYPISANIA DLA LOKALIZACJI I LISTY :


PLIK1:
wzorzec: “aa”
aaaaaaaa
aaaababeiu
2. wzorzec: “ab”
aaaab
aaaababeiu
PLIK2:
…

Drukowanie zadanego pliku z zaznaczonymi kolorem miejscami, ktore zostaly pasuja do zadanego wzorca
Find and replace
Usuwanie linii z pliku ktore pasuja do wzorca / tych ktore nie pasuja

