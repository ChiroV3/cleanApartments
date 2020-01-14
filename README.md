Clean Apartments
Informacje dotyczące aplikacji
-Aplikacja ma na celu poprawę oraz optymalizację procesu czyszczenia apartamentów. Ze względu na rosnącą liczbę apartamentów zarządzający nimi ludzie mają problem z dogadywaniem się ze sprzątaczami, który apartament został posprzątany i wymaga ponownego sprzątania, proces ten do tej pory odbywa się telefonicznie, często pojawiają się pomyłki. Aplikacja umożliwia umieszczanie i zarządzanie takimi informacjami w jednym miejscu.
Uruchomienie aplikacji
1.	Pobrać repozytorium z aplikacja wykonaną w ASP MVC CORE
2.	Należy wykonać na serwerze postgresql skrypt, który  utworzy bazę danych oraz wypełni ją początkowymi danymi. Plik o nazwie: „createDatabase.sql” a następnie wykonać skrypt który wypełni bazę przykładowymi danymi „data.sql”
3.	Ustawić w appsettings.json głownego projektu scieżkę do bazy danych, pod parametrem „DefaultConnection”.
4.	Uruchomić Aplikację.

Obsługa aplikacji
1.	Po otworzeniu aplikacji na stronie głównej, aby zarządzać główną funkcjonalnością aplikacji należy wybrać z navigation bar „Apartments”
2.	Otworzy się strona na której znajdują się trzy główne elementy:
a.	Locations – lista lokalizacji, po której kliknięciu załaduje się nam lista z przypisanymi do lokalizacji apartamentami
b.	Apartments – lista apartamentów czekających na sprzątanie dla wybranej lokalizacji
c.	Cleaned Apartments – lista apartamentów które zostały już posprzątane, z tej listy możemy wybrać apartament i wysłać ponownie do sprzątania

3.	Przykładowy scenariusz:
Wchodzimy na strone „Apartments”, klikamy na pierwszą lokalizację, z listy, która załaduje nam się po prawej stronie wybieramy apartament który posprzątaliśmy i klikamy „Clean Apartment”, Załaduje nam się formularz, po jego wypełnieniu, klikamy na przycisk „Complete Cleaning”. Apartament zostanie przeniesiony do listy „Cleaned Apartments” z której za pomocą przycisku „Send to cleaning” możemy wysłać go do listy oczekujących na posprzątanie.
