
--- Progetto esame Codifica di Testi a.a. 18/19 ---

ver. 1.0

BUG NOTI: 
 - script map_responsive.js, dopo il primo window.resize si presenta un errore in quanto i valori delle coordinate vengono ricalcolati 
   non su il valore originale (indicato in cod. TEI) ma sul valore relativo ottenuto dal calcolo del primo 
   window.resize.
   Sistemabile passando i valori delle coordinate originarie (cod. TEI) in un attributo come 'itemprop' sui quali
   ricalcolare ogni volta i valori relativi delle coordinate.
