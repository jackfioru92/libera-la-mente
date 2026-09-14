// Costanti di configurazione dell'app (contatti, donazioni).

/// Email dell'autore: usata per le donazioni PayPal e per il contatto.
const String kContactEmail = 'fgiacomo92@gmail.com';

/// Link "offrimi un caffè".
///
/// Il flusso PayPal "Donate" (`/donate/?business=...`) è riservato alle
/// organizzazioni: con un conto personale mostra "l'organizzazione non può
/// accettare donazioni". Qui si usa il pagamento classico a importo libero,
/// che i conti personali accettano. Se crei un link PayPal.Me (paypal.me),
/// sostituisci l'intera stringa con `https://paypal.me/<tuonome>`.
///
/// Nota store: donazioni e abbonamenti allo sviluppatore dentro l'app
/// dovrebbero passare da Google Play Billing / Apple IAP; il link esterno
/// è tollerato su Play, a rischio su App Store. Da valutare prima del rilascio.
final String kDonateUrl = Uri.https('www.paypal.com', '/cgi-bin/webscr', {
  'cmd': '_xclick',
  'business': kContactEmail,
  'currency_code': 'EUR',
  'item_name': 'Un caffè per Libera la Mente',
  'no_shipping': '1',
}).toString();
