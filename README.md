[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/G9fQk55K)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=16976416&assignment_repo_type=AssignmentRepo)

# TransferMarket - Jugadors Destacats

## Descripció del projecte

Aquest projecte crea una web interactiva on es poden visualitzar els perfils dels jugadors de futbol més destacats del moment. A través d'una interfície dinàmica, els usuaris poden veure informació com el nom, l'equip, la posició i el valor de mercat dels jugadors. També permet afegir jugadors nous a la llista mitjançant un formulari, i eliminar jugadors. 

La informació dels jugadors està emmagatzemada en un arxiu XML i la pàgina es genera mitjançant XSLT per convertir aquest XML en una pàgina HTML visualment atractiva.

## Eines utilitzades

### Part Servidor
- **XML**: Per emmagatzemar la informació sobre els jugadors.
- **XSLT**: Per transformar el document XML en HTML i aplicar-hi una presentació estilitzada.
- **CSS**: Per aplicar l'estil visual a la pàgina web.
- **JavaScript**: Per gestionar la interacció de l'usuari, com afegir jugadors mitjançant formularis i eliminar-los de la vista.

## Estructura de carpetes

El projecte està organitzat de la següent manera:

Exercicis/ 
├── transfermarket.xml # Arxiu XML principal amb la informació dels jugadors 
├── transfermarket.xslt # Arxiu XSLT per transformar el XML en HTML 
├── transfermarket.css # Arxiu CSS per l'estil de la pàgina 
├── formulario.xml # Arxiu XML per al formulari d'entrada de jugadors 
├── formulario.xslt # Arxiu XSLT per transformar el formulari 
└── img/ 
    ├── messi.jpg # Imatge del jugador Messi 
    ├── cristiano.jpg # Imatge del jugador Cristiano Ronaldo 
    ├── mbappe.jpg # Imatge del jugador Mbappé 
    └── ... (altres imatges)

## Requeriments per a l'execució del projecte

Per a executar aquest projecte en el teu sistema local, assegura't de tenir els següents requisits:

- **Navegador web modern** (Google Chrome, Firefox, etc.) que admeti la visualització de pàgines XSLT.
- **Servidor local**: El projecte utilitza arxius XML i XSLT, i, per a una correcta visualització, és recomanable utilitzar un servidor web local com XAMPP, MAMP o servir els arxius a través de qualsevol servidor web com Apache o Nginx.
  
## Instruccions per a la instal·lació i execució

1. **Descarregar el projecte**: 
   Descarrega el projecte des del repositori GitHub o clona'l amb la següent comanda:
   
   ```bash
   git clone <URL_DEL_REPOSITORI>

2. Obrir el projecte en un servidor local: Col·loca els arxius en un directori del servidor web local (per exemple, en la carpeta htdocs de XAMPP o www de MAMP).

3. Accedir a la pàgina principal: Un cop el servidor local estigui en marxa, obre el navegador i accedeix a http://localhost/<directori_del_projecte>/transfermarket.xml. Aquesta pàgina carregarà els jugadors destacats i permetrà veure la seva informació.

4. Afegir nous jugadors: Per afegir nous jugadors, accedeix a http://localhost/<directori_del_projecte>/formulario.xml on podràs emplenar el formulari per afegir jugadors.

5. Eliminar jugadors: Pots eliminar jugadors de la vista dinàmica fent clic al botó "Borrar" associat a cada jugador.

També es pot fer descarreguant-ho a git hub i afegint aquesta comanda a la termianl: python -m http.server 8000, per aixi poder obrir el projecte sencer i entrear a transfermarket.xml per a poder visualitzar-ho.

## Notes importants
La llista de jugadors es guarda en localStorage, per tant, els jugadors afegits només es mostraran mentre la pàgina estigui oberta. Quan es tanca la finestra, la informació es perd.

Els formularis permeten afegir informació com el nom, l'equip, la posició, el valor de mercat i la imatge del jugador, però la gestió de la imatge es realitza amb un sistema en base64 a través de localStorage.

## Desenvolupadors
. Izan Bueno
. Adrià Garzón
