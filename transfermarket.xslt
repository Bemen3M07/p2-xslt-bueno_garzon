<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" />

    <!-- Plantilla principal -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Jugadors de Futbol - Transfermarkt</title>
                <link rel="stylesheet" type="text/css" href="transfermarket.css" />
            </head>
            <body>
                <header>
                    <h1>Jugadors de Futbol</h1>
                </header>

                <main>
                    <section class="jugadors">
                        <!-- Iterem per cada jugador -->
                        <xsl:for-each select="jugadors/jugador">
                            <div class="jugador-card">
                                <h2 class="nom"><xsl:value-of select="nom" /></h2>
                                <p class="equip">Equip: <xsl:value-of select="equip" /></p>
                                <p class="posicio">Posició: <xsl:value-of select="posicio" /></p>
                                <p class="valorMercat">Valor de mercat: <xsl:value-of select="valorMercat" /></p>
                            </div>
                        </xsl:for-each>
                    </section>
                </main>

                <footer>
                    <p>&#169; 2023 Transfermarkt - Jugadors de Futbol</p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>