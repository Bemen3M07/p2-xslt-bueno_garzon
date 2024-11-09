<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

    <xsl:template match="/">
        <html lang="ca">
            <head>
                <title>Añadir Nuevo Jugador</title>
                <link rel="stylesheet" href="transfermarket.css"/>
                <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap" rel="stylesheet"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            </head>
            <body>
                <header>
                    <h1>Añadir Nuevo Jugador</h1>
                </header>
                <main>
                    <form id="formJugador">
                        <label for="nom">Nom:</label>
                        <input type="text" id="nom" name="nom" required="required"/>
                        
                        <label for="equip">Equip:</label>
                        <input type="text" id="equip" name="equip" required="required"/>
                        
                        <label for="posicio">Posició:</label>
                        <input type="text" id="posicio" name="posicio" required="required"/>
                        
                        <label for="valorMercat">Valor de Mercat:</label>
                        <input type="text" id="valorMercat" name="valorMercat" required="required"/>
                        
                        <label for="imatge">Imatge:</label>
                        <input type="file" id="imatge" name="imatge" accept="image/*" required="required"/>
                        
                        <button type="button" onclick="guardarJugador()">Guardar Jugador</button>
                    </form>
                </main>           
                
                <script>
                    function guardarJugador() {
                        const nom = document.getElementById('nom').value;
                        const equip = document.getElementById('equip').value;
                        const posicio = document.getElementById('posicio').value;
                        const valorMercat = document.getElementById('valorMercat').value;

                        const imatgeInput = document.getElementById('imatge');
                        const reader = new FileReader();
                        reader.onload = function(event) {
                            const imatge = event.target.result;

                            const jugador = {
                                nom: nom,
                                equip: equip,
                                posicio: posicio,
                                valorMercat: valorMercat,
                                imatge: imatge
                            };

                            let jugadors = JSON.parse(localStorage.getItem('jugadors')) || [];
                            jugadors.push(jugador);
                            localStorage.setItem('jugadors', JSON.stringify(jugadors));

                            alert('Jugador guardat amb èxit.');
                            document.getElementById("formJugador").reset();
                            window.location.href = 'transfermarket.xml'; // Redirect to the main page
                        };
                        reader.readAsDataURL(imatgeInput.files[0]);
                    }
                </script>

                <button id="retroceder" onclick="window.location.href='transfermarket.xml'">Retroceder</button>
                <footer>
                    <p>© 2023 Jugadores Futbol</p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>