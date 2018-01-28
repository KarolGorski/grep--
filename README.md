# grep--
Bash-based implementation of our totally-new-grep :D Group project for Linux's Fundamentals lessons.

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

