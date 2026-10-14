# Overdracht: configurator-calculator voor tuinhuisverkopers

Branch: `ccr-6850faaf-zjp57l` (gepusht, geen pull request). Hoofdbestand: `tuinhuis-calculator.html`. Overige: `supabase/tuinhuis_sessies.sql`, alinea in `privacy.html`.

## Doel
Ontwikkelaar (jij) verkoopt een online tuinhuisconfigurator met persoonlijke klantlinks aan een verkoper van tuinhuizen (12.000 tot 18.000 euro). De calculator is bedoeld voor de verkoper om mee te spelen, jij ontvangt per sessie de invoer in Supabase. Prijsstrategie zonder vaste maandkosten, geïnspireerd op Hormozi ($100M Offers, Leads, Money Models). Hormozi-bronnen zijn samenvattingen van derden, niet het boek zelf.

## Wat er staat
- Zeven tot negen invoersliders: aanvragen per maand, offerte- en tekenpercentage, verkoopprijs, marge, extra's (aandeel, waarde, marge), gebruik van links, marketingkosten, vervolgaankopen.
- Effect van de tool: scenario's geen, voorzichtig, verwacht, ambitieus en drie eigen schuiven.
- Drie prijsopties, geen vaste kosten: Starter (per link), Groei (lagere prijs per link plus commissie op extra optieomzet), Partner (percentage van extra marge boven een drempel, betaal niets zonder resultaat). Pilot: eerste 25 links gratis (voorbeeld, nog af te spreken).
- Uitkomsten: netto extra marge, break-even, kosten bij geen effect, CAC, LTV, LTV:CAC, vergelijking van de drie prijsopties.
- SEO en GEO (optie A, doorverwijzing naar partner) en Google Ads naar de configurator (zelf doen, landingspagina op een site met weinig verkeer). Vergelijkingstabel: alleen configurator, alleen SEO en GEO, beide, configurator plus Google Ads.
- Bronnen per veld (chips) en een bronnentabel met betrouwbaarheid.
- Supabase: één rij per gebeurtenis (wijziging, bron geopend, bronlink geklikt, contact), sessie-id in het geheugen van de pagina (geen cookies). Bij `contact` ook het mailadres, alleen met toestemming.

## Nog te doen
1. **Supabase koppelen:** `supabase/tuinhuis_sessies.sql` in de SQL Editor uitvoeren, daarna `SUPABASE_URL` en `SUPABASE_KEY` (anon public key, nooit de service key) bovenin het script invullen. Opslag is nu uitgeschakeld zolang die leeg zijn. Niet getest tegen een echte database.
2. **Keyword Planner:** zoekvolume en klikprijs voor tuinhuis- en tuinkamerzoektermen ophalen en in de calculator zetten. Zoekwoorden onderaan.
3. **Echte cijfers van de eerste klant:** twaalf maanden aanvragen, offertes, orders, orderwaarde, marge, marketingkosten. Vervang de aannames.
4. **Pilot opzetten:** 4 tot 8 weken, A/B of via advertenties, om je eigen conversiecijfers te krijgen.
5. **Beslissen:** plafond op de Partnerfee, definitie van wanneer een link telt, minimale looptijd en regeling na einde contract.
6. **Publiceren:** de pagina staat op `noindex`. Hosting (bijvoorbeeld GitHub Pages) en deelbare link regelen.

## Belangrijkste inzichten
- Conversiecijfers in de branche komen bijna volledig van configuratorleveranciers (SaleSqueze en anderen). Zie ze als bovengrens. Geen onafhankelijke benchmark gevonden voor marge of orderwaarde.
- De configurator alleen verandert CAC en LTV weinig, want een tuinhuis is een eenmalige aankoop. De hefboom zit in extra aanvragen (SEO, GEO, advertenties), de configurator rondt die beter af. Spolding and Sons: pas met een complete trechter steeg de verkoop.
- Bij Partner betaalt de klant in een goed scenario meer dan bij Starter. Het gaat om verdeling van risico, niet om lagere kosten.
- SEO en GEO verlagen de CAC alleen als de kosten per extra klant onder de huidige CAC blijven. Bij standaardwaarden stijgt de CAC licht.
- Google Ads: klikprijs voor duurdere woonaankopen kan veel hoger zijn dan de Nederlandse gemiddelden (circa 2 euro). De US-benchmark voor home improvement is circa 8 dollar. De 70.000 euro netto in de calculator bij standaardwaarden is een bovengrens.
- AVG: jij bent verwerker van leadgegevens van eindklanten zodra de configurator echt wordt ingezet. Verwerkersovereenkomst en toestemmingstekst nodig, plus regeling voor data na einde contract.

## Zoekwoorden voor de Keyword Planner
Locatie Nederland, taal Nederlands, laatste 12 maanden. Noteer zoekvolume en biedbereik (laag en hoog).

tuinhuis kopen, tuinhuis op maat, tuinhuis geïsoleerd, tuinhuis met overkapping, luxe tuinhuis, tuinkamer, tuinkamer op maat, tuinkamer kopen, tuinkamer geïsoleerd, tuinkamer prijzen, tuinkamer configurator, tuinhuis configurator, tuinhuis ontwerpen, tuinhuis laten bouwen, houten tuinhuis, moderne tuinhuis, tuinhuis als kantoor, tuinhuis met slaapkamer

## Voorstel om lokaal te starten
1. `git fetch && git checkout ccr-6850faaf-zjp57l`
2. Open `tuinhuis-calculator.html` direct in de browser (statisch, geen build). Lettertypen laden alleen via de site-root.
3. Volgende stap: Keyword Planner invullen, dan Supabase koppelen.
