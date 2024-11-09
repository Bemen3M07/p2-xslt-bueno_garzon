<!-- Especifica que utilitzarem XSLT per transformar l'XML en HTML -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Configura la sortida del document com a HTML i utilitza el DTD HTML 4.01 Transitional -->
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>
    <!-- La plantilla principal que s'aplica quan l'XML es transforma -->
    <xsl:template match="/">
        <html lang="ca"> <!-- Defineix l'idioma de la pàgina web com a català -->
            <head>
                <title>Afegir un Nou Jugador</title> <!-- Títol de la pàgina -->
                <link rel="stylesheet" href="transfermarket.css"/> <!-- Enllaç al full d'estil extern -->
                <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap" rel="stylesheet"/> <!-- Enllaç a les fonts de Google Fonts per usar Roboto -->
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/> <!-- Meta tag per fer que la pàgina sigui responsive a dispositius mòbils -->
            </head>
            <body>
                <header>
                    <h1>Afegir un Nou Jugador</h1> <!-- Títol principal de la pàgina -->
                </header>
                <main>
                    <!-- Formulari per afegir un nou jugador -->
                    <form id="formJugador">
                        <!-- Camp per introduir el nom del jugador -->
                        <label for="nom">Nom:</label>
                        <input type="text" id="nom" name="nom" required="required"/>
                        
                        <!-- Camp per introduir l'equip del jugador -->
                        <label for="equip">Equip:</label>
                        <input type="text" id="equip" name="equip" required="required"/>
                        
                        <!-- Camp per introduir la posició del jugador -->
                        <label for="posicio">Posició:</label>
                        <input type="text" id="posicio" name="posicio" required="required"/>
                        
                        <!-- Camp per introduir el valor de mercat del jugador -->
                        <label for="valorMercat">Valor de Mercat:</label>
                        <input type="text" id="valorMercat" name="valorMercat" required="required"/>
                        
                        <!-- Camp per carregar la imatge del jugador -->
                        <label for="imatge">Imatge:</label>
                        <input type="file" id="imatge" name="imatge" accept="image/*" required="required"/>
                        
                        <!-- Botó per guardar el jugador -->
                        <button type="button" onclick="guardarJugador()">Guardar Jugador</button>
                    </form>
                </main>           
                
                <!-- Script JavaScript per guardar el jugador en localStorage -->
                <script>
                    function guardarJugador() {
                        // Obtenim els valors introduïts pel formulari
                        const nom = document.getElementById('nom').value;
                        const equip = document.getElementById('equip').value;
                        const posicio = document.getElementById('posicio').value;
                        const valorMercat = document.getElementById('valorMercat').value;

                        const imatgeInput = document.getElementById('imatge');
                        const reader = new FileReader();  // Usant FileReader per llegir la imatge carregada

                        reader.onload = function(event) {
                            const imatge = event.target.result;  // Obtenim la imatge carregada en base64

                            // Creem l'objecte del jugador amb les dades del formulari
                            const jugador = {
                                nom: nom,
                                equip: equip,
                                posicio: posicio,
                                valorMercat: valorMercat,
                                imatge: imatge
                            };

                            // Obtenim la llista de jugadors des de localStorage si existeix o creem un array buit
                            let jugadors = JSON.parse(localStorage.getItem('jugadors')) || [];
                            jugadors.push(jugador);  // Afegim el nou jugador
                            localStorage.setItem('jugadors', JSON.stringify(jugadors));  // Guardem els canvis al localStorage

                            alert('Jugador guardat amb èxit.');  // Missatge d'alerta per confirmar la guardada
                            document.getElementById("formJugador").reset();  // Reiniciem el formulari
                            window.location.href = 'transfermarket.xml';  // Redirigim a la pàgina principal
                        };
                        reader.readAsDataURL(imatgeInput.files[0]);  // Llegim el primer arxiu d'imatge seleccionat
                    }
                </script>

                <!-- Botó per retrocedir a la pàgina principal -->
                <button id="retroceder" onclick="window.location.href='transfermarket.xml'">Retroceder</button>

                <footer>
                    <!-- Peu de pàgina -->
                    <p>© 2024 Transfermarket - Jugadors Destacats - Izan Bueno i Adrià Garzón</p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>