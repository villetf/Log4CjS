# Log4CjS

Log4CjS är en plattform för insamling av statistik från [CjS](https://github.com/villetf/CjS "CjS på Github"), [WebAssistant](https://github.com/villetf/WebAssistant "WebAssistant på Github"), [MonitoringHostManager](https://github.com/villetf/MonitoringHostManager "MonitoringHostManager på Github") och [SupportTools](https://github.com/villetf/SupportTools "SupportTools på Github").

Nuvarande version är 1.1.1.

Metriken skickas med hjälp av API-anrop till servern serverX, där det lagras i en databas.

Log4CjS är skrivet av Vilhelm Fontell i JavaScript och körs med hjälp av Node.js.

## Sanering

Koden i detta repo skrevs för användning hos en tidigare arbetsgivare. Av denna anledning har all information som skulle kunna vara känslig helt och hållet rensats bort. Exempel på detta är servernamn, URL:er, känslig logik, detaljer om organisationen och systemnamn. Systemnamn har ersatts av ett ord som förklarar vad det är för typ av system för att ge ett sammanhang. 

Repot kan eller ska alltså inte användas till något i sin nuvarande form utan fungerar bara som ett exempel på vad jag har skrivit tidigare. 

## Systembeskrivning

Log4CjS körs på servern serverX med hjälp av Node.js, vilket betyder att även webbservern är egenutvecklad. 

Datat skickas som JSON med hjälp av ett Post-anrop där endast metrik som följer ett visst format accepteras. Formateringen ser ut som följande:

{
   "token": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
   "user": "Vilhelm Fontell",
   "button": 1,
   "object": "server01"
}

**token** är en autentiseringsnyckel som används för att autentisera sig mot Log4CjS.

**user** måste vara en sträng och är namnet på den som utlöst knappen eller funktionen. Namnet omvandlas till ett användar-ID innan det skrivs till databasen.

**button** måste vara ett heltal högre än 0 och är ID:t på den knapp eller funktion som använts.

**object** är inte obligatoriskt men måste, om det finns, vara en sträng. Object är det objekt som berörts när funktionen körts, till exempel ett hostnamn om man använt en knapp för att söka i CMDB. Object samlas inte in på de funktioner där det inte är applicerbart.

Datat valideras, saneras efter skadlig kod, och skrivs därefter till databasen. Även tid och datum för skrivningen skrivs till databasen.

Datat i databasen visualiseras därefter med hjälp av Visualiseringssystem.

## Användning

Eftersom skrivningar till Log4CjS är inbyggda i CjS och övriga verktyg sker metrikinsamlingen helt automatiskt, utan att användaren varken märker eller behöver tänka på det.

## Support

För buggrapporter och förbättringsförslag, [öppna ett issue i Kodplattformen.](https://codeplatform.domain.se/team/log4cjs/-/issues "Issue") Märk issuet med någon av labelarna "Bugg" eller "Förbättringsförslag".