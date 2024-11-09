<?xml version="1.0" encoding="UTF-8"?> <!-- Declaració de la versió XML i l'encoding del document -->
<!-- Especifica el començament de l'estil XSL, que utilitza la versió 1.0 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Inici de la plantilla principal que transforma el document XML en HTML -->
    <xsl:template match="/">
        <html lang="ca"> <!-- Estableix l'idioma de la pàgina web com a català -->
            <head>
                <meta charset="UTF-8"/> <!-- Defineix la codificació de caràcters per garantir la compatibilitat amb caràcters especials -->
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/> <!-- Ajusta la visualització per a dispositius mòbils -->
                <title> TRANSFERMARKET - Jugadors Destacats </title> <!-- Títol de la pàgina -->
                <link rel="stylesheet" href="transfermarket.css"/> <!-- Enllaç a l'estil CSS extern per donar estil a la pàgina -->
                <!-- Enllaç a la font de Google Fonts per utilitzar la font Roboto -->
                <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap" rel="stylesheet"/>
                
                <!-- Script per gestionar la càrrega i eliminació dinàmica de jugadors a partir de localStorage -->
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        // Càrrega dels jugadors des de localStorage
                        const jugadorsLocal = JSON.parse(localStorage.getItem("jugadors")) || [];
                        const fitxesJugadors = document.querySelector(".fitxes-jugadors");

                        // Funció per eliminar un jugador de localStorage
                        function eliminarJugador(index) {
                            jugadorsLocal.splice(index, 1);  // Elimina el jugador del llistat
                            localStorage.setItem("jugadors", JSON.stringify(jugadorsLocal));  // Guarda els canvis
                            location.reload();  // Recarrega la pàgina per actualitzar la vista
                        }

                        // Inserir els jugadors carregats en localStorage dins de la pàgina HTML
                        jugadorsLocal.forEach((jugador, index) => {
                            const fitxa = document.createElement("article");  // Crea un article per cada jugador
                            fitxa.classList.add("fitxa");

                            const img = document.createElement("img");  // Crea una imatge per al jugador
                            img.setAttribute("src", jugador.imagen);
                            img.setAttribute("alt", "Foto de " + jugador.nom);

                            const fitxaContent = document.createElement("div");  // Crea una secció de contingut per al jugador
                            fitxaContent.classList.add("fitxa-content");

                            const h2 = document.createElement("h2");
                            h2.textContent = jugador.nom;  // Nom del jugador

                            const equipP = document.createElement("p");
                            equipP.innerHTML = "<strong>Equip:</strong> " + jugador.equip;  // Equip del jugador

                            const posicioP = document.createElement("p");
                            posicioP.innerHTML = "<strong>Posició:</strong> " + jugador.posicio;  // Posició del jugador al camp

                            const valorMercatP = document.createElement("p");
                            valorMercatP.innerHTML = "<strong>Valor de Mercat:</strong> " + jugador.valorMercat;  // Valor del jugador en el mercat

                            const deleteButton = document.createElement("button");  // Botó per eliminar el jugador
                            deleteButton.textContent = "Borrar";  // Text del botó
                            deleteButton.classList.add("delete-button");
                            deleteButton.addEventListener("click", function(e) {
                                e.stopPropagation();  // Evita que el clic afecti a l'element inicial o pare
                                eliminarJugador(index);  // Crida a la funció per eliminar el jugador
                            });

                            // Afegir els elements dins de la fitxa
                            fitxaContent.appendChild(h2);
                            fitxaContent.appendChild(equipP);
                            fitxaContent.appendChild(posicioP);
                            fitxaContent.appendChild(valorMercatP);
                            fitxaContent.appendChild(deleteButton);

                            fitxa.appendChild(img);  // Afegir la imatge a la fitxa
                            fitxa.appendChild(fitxaContent);  // Afegir el contingut de la fitxa

                            fitxesJugadors.appendChild(fitxa);  // Afegir la fitxa al contenidor de jugadors
                        });
                    });
                </script>
            </head>
            <body>
                <header>
                    <h1> TRANSFERMARKET - Jugadors Destacats </h1>  <!-- Títol principal -->
                    <p>Descobreix el perfil dels jugadors més destacats del moment. Coneix els equips on juguen, les seves posicions al camp i el seu valor actual de mercat.</p>  <!-- Descripció del lloc -->
                </header>

                <main>
                    <section class="fitxes-jugadors">  <!-- Secció on es mostren les fitxes dels jugadors -->
                        <!-- Els jugadors es carregaran dinàmicament aquí -->
                        <xsl:for-each select="jugadors/jugador">  <!-- Itera sobre els jugadors del XML -->
                            <article class="fitxa">  <!-- Cada jugador és una fitxa -->
                                <img src="{imagen}" alt="Foto de {nom}"/>  <!-- Imatge del jugador -->
                                <div class="fitxa-content">
                                    <h2><xsl:value-of select="nom"/></h2>  <!-- Nom del jugador -->
                                    <p><strong>Equip:</strong> <xsl:value-of select="equip"/></p>  <!-- Equip del jugador -->
                                    <p><strong>Posició:</strong> <xsl:value-of select="posicio"/></p>  <!-- Posició del jugador -->
                                    <p><strong>Valor de Mercat:</strong> <xsl:value-of select="valorMercat"/></p>  <!-- Valor de mercat del jugador -->
                                    <button class="delete-button" onclick="eliminarJugadorXSL()">Borrar</button>  <!-- Botó per eliminar el jugador -->
                                </div>
                            </article>
                        </xsl:for-each>
                    </section>
                </main>

                <!-- Enllaç per afegir un nou jugador -->
                <a href="formulario.xml">
                    <button id="AfegirJugador">Afegir Jugador</button>
                </a>

                <footer>
                    <p>© 2024 Transfermarket - Jugadors Destacats - Izan Bueno i Adrià Garzón</p>  <!-- Peu de pàgina amb crèdits -->
                </footer>

                <script>
                    // Funció placeholder per eliminar jugadors del XML (no implementada)
                    function eliminarJugadorXSL() {
                        alert("Funcionalidad aún no implementada para eliminar del XML.");
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>