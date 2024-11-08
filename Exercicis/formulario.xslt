<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" />

    <xsl:template match="/formulario">
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <title>Añadir Nuevo Jugador</title>
                <!-- Enlace al archivo CSS externo -->
                <link rel="stylesheet" href="transfermarket.css" />
            </head>
            <body>
                <h1>Añadir Nuevo Jugador</h1>

                <form>
                    <label for="nom">Nombre:</label>
                    <input type="text" id="nom" name="nom" />

                    <label for="equip">Equipo:</label>
                    <input type="text" id="equip" name="equip" />

                    <label for="posicio">Posición:</label>
                    <input type="text" id="posicio" name="posicio" />

                    <label for="valorMercat">Valor de Mercado:</label>
                    <input type="text" id="valorMercat" name="valorMercat" />

                    <label for="imagen">Imagen:</label>
                    <input type="file" id="imagen" name="imagen" accept="image/*" />

                    <button type="submit">Guardar Jugador</button>
                </form>

              <script>
    function guardarJugador() {
        // Obtenemos los datos del formulario
        const nom = document.getElementById('nom').value;
        const equip = document.getElementById('equip').value;
        const posicio = document.getElementById('posicio').value;
        const valorMercat = document.getElementById('valorMercat').value;
        const imagenInput = document.getElementById('imagen');
        
        // Convertir la imagen a Base64
        const reader = new FileReader();
        reader.onload = function(event) {
            const imagen = event.target.result;

            // Crear objeto jugador
            const jugador = {
                nom: nom,
                equip: equip,
                posicio: posicio,
                valorMercat: valorMercat,
                imagen: imagen
            };

            // Recuperamos los jugadores almacenados en el localStorage o iniciamos con un array vacío
            let jugadores = JSON.parse(localStorage.getItem('jugadores')) || [];

            // Añadimos el nuevo jugador al array
            jugadores.push(jugador);
            
            // Guardamos la lista actualizada en el localStorage
            localStorage.setItem('jugadores', JSON.stringify(jugadores));

            // Actualizamos la vista con los nuevos jugadores
            mostrarJugadores();

            alert('Jugador guardado exitosamente.');
            document.getElementById("formJugador").reset();
        };
        
        // Convertimos la imagen a Base64
        reader.readAsDataURL(imagenInput.files[0]);
    }

    function mostrarJugadores() {
        // Obtenemos la lista de jugadores almacenados
        let jugadores = JSON.parse(localStorage.getItem('jugadores')) || [];
        
        // Seleccionamos el contenedor donde mostraremos los jugadores
        const jugadoresContainer = document.getElementById('jugadoresContainer');
        
        // Limpiamos el contenedor
        jugadoresContainer.innerHTML = '';

        // Iteramos sobre los jugadores y los mostramos
        jugadores.forEach(jugador => {
            const jugadorCard = document.createElement('div');
            jugadorCard.classList.add('jugador-card');

            jugadorCard.innerHTML = `
                <img class="jugador-imagen" src="${jugador.imagen}" alt="${jugador.nom}" />
                <h2 class="nom">${jugador.nom}</h2>
                <p class="equip">Equipo: ${jugador.equip}</p>
                <p class="posicio">Posición: ${jugador.posicio}</p>
                <p class="valorMercat">Valor de mercado: ${jugador.valorMercat}</p>
            `;

            jugadoresContainer.appendChild(jugadorCard);
        });
    }

    // Mostrar los jugadores al cargar la página
    window.onload = mostrarJugadores;
</script>



                <!-- Botón para volver a la página anterior -->
                <button onclick="window.history.back()">Volver a la Página Anterior</button>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
