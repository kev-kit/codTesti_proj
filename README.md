# Codifica di Testi
Progetto realizzato per l'esame di Codifica di Testi.
Sono state digitalizzate due cartoline storiche e rese fruibili tramite una interfaccia web.

L'interfaccia è visualizzabile all'indirizzo:

https://htmlpreview.github.io/?https://github.com/kev-kit/codTesti_proj/blob/master/progetto_CodTesti/index.html
>(potrebbe essere necessario ricaricare la pagina per visualizzare il contenuto correttamente)

##Il Progetto
Il primo passo della digitalizzazione delle cartoline è stato fatta annotare il testo delle cartoline con lo standard di **codifica TEI**, Text Encoding Initiative (https://tei-c.org/).

Una volta annotato il testo delle cartoline, i file **XML** e **XSL**, relativi all'annotazione delle cartoline e allo stile della pagina web da generare, sono stati trasformati con il processore **XSLT** nel file **HTML** della pagina web.

Il file **HTML** fa riferimento il foglio di stile **CSS** per la formattazione dei contenuti e agli script **Javascript** che permettono di visualizzare *come la digitalizzazione viene presentata*: nella pagina web le immagini delle cartoline sono affiancate dal testo riportato in versione digitale; muovendo il cursore del mouse sopra le immagini delle cartoline viene messo in evidenza il rispettivo testo digitalizzato. 

In collaborazione con il CNR di Pisa.
