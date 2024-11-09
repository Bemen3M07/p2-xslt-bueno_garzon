<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html lang="ca">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title> Jugadores Destacados </title>
                <link rel="stylesheet" href="transfermarket.css"/>
                <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap" rel="stylesheet"/>
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        // Cargar los jugadores desde localStorage
                        const jugadorsLocal = JSON.parse(localStorage.getItem("jugadors")) || [];
                        const fitxesJugadors = document.querySelector(".fitxes-jugadors");

                        // Función para eliminar un jugador de localStorage
                        function eliminarJugador(index) {
                            jugadorsLocal.splice(index, 1);
                            localStorage.setItem("jugadors", JSON.stringify(jugadorsLocal));
                            location.reload();
                        }

                        // Insertar los jugadores almacenados en localStorage
                        jugadorsLocal.forEach((jugador, index) => {
                            const fitxa = document.createElement("article");
                            fitxa.classList.add("fitxa");

                            const img = document.createElement("img");
                            img.setAttribute("src", jugador.imagen);
                            img.setAttribute("alt", "Foto de " + jugador.nom);

                            const fitxaContent = document.createElement("div");
                            fitxaContent.classList.add("fitxa-content");

                            const h2 = document.createElement("h2");
                            h2.textContent = jugador.nom;

                            const equipP = document.createElement("p");
                            equipP.innerHTML = "<strong>Equip:</strong> " + jugador.equip;

                            const posicioP = document.createElement("p");
                            posicioP.innerHTML = "<strong>Posició:</strong> " + jugador.posicio;

                            const valorMercatP = document.createElement("p");
                            valorMercatP.innerHTML = "<strong>Valor de Mercat:</strong> " + jugador.valorMercat;

                            const deleteButton = document.createElement("button");
                            deleteButton.textContent = "Borrar";
                            deleteButton.classList.add("delete-button");
                            deleteButton.addEventListener("click", function(e) {
                                e.stopPropagation();
                                eliminarJugador(index);
                            });

                            fitxaContent.appendChild(h2);
                            fitxaContent.appendChild(equipP);
                            fitxaContent.appendChild(posicioP);
                            fitxaContent.appendChild(valorMercatP);
                            fitxaContent.appendChild(deleteButton);

                            fitxa.appendChild(img);
                            fitxa.appendChild(fitxaContent);

                            fitxesJugadors.appendChild(fitxa);
                        });
                    });
                </script>
            </head>
            <body>
                <header>
                    <h1>Jugadores Destacados</h1>
                    <p>Listado de los jugadores mas destacados</p>
                </header>

                <main>
                    <section class="fitxes-jugadors">
                        <!-- Los jugadores se cargarán dinámicamente aquí -->
                        <xsl:for-each select="jugadors/jugador">
                            <article class="fitxa">
                                <img src="{imagen}" alt="Foto de {nom}"/>
                                <div class="fitxa-content">
                                    <h2><xsl:value-of select="nom"/></h2>
                                    <p><strong>Equip:</strong> <xsl:value-of select="equip"/></p>
                                    <p><strong>Posició:</strong> <xsl:value-of select="posicio"/></p>
                                    <p><strong>Valor de Mercat:</strong> <xsl:value-of select="valorMercat"/></p>
                                    <button class="delete-button" onclick="eliminarJugadorXSL()">Borrar</button>
                                </div>
                            </article>
                        </xsl:for-each>
                    </section>
                </main>
                <a href="formulario.xml">
                    <button id="AfegirJugador">Afegir Jugador</button>
                </a>
                <footer>
                    <p>© 2023 Jugadores Favoritos</p>
                </footer>

                <script>
                    function eliminarJugadorXSL() {
                        alert("Funcionalidad aún no implementada para eliminar del XML.");
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>