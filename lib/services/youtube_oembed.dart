import 'dart:convert';
import 'dart:io';

/// Recupera titolo e canale di un video tramite l'endpoint pubblico oEmbed di
/// YouTube (nessuna API key). Restituisce null se il video non esiste o non è
/// incorporabile.
Future<({String title, String author})?> fetchYoutubeInfo(
  String videoId,
) async {
  final client = HttpClient()..connectionTimeout = const Duration(seconds: 8);
  try {
    final uri = Uri.parse(
      'https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=$videoId&format=json',
    );
    final req = await client.getUrl(uri);
    final res = await req.close();
    if (res.statusCode != 200) return null;
    final body = await res.transform(utf8.decoder).join();
    final j = jsonDecode(body) as Map<String, dynamic>;
    return (
      title: (j['title'] as String?) ?? 'Video YouTube',
      author: (j['author_name'] as String?) ?? '',
    );
  } catch (_) {
    return null;
  } finally {
    client.close(force: true);
  }
}
