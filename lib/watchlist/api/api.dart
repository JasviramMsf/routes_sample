import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:routes/watchlist/utils/constants.dart';
import 'package:routes/watchlist/modal/watchlist_modal.dart';

Future<List<WatchlistModal>> fetchWatchlistApi() async {
  final response = await http.get(Uri.parse(GET_WATCHLIST_URI));
  if (response.statusCode == 200 && response.body.isNotEmpty) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => WatchlistModal.fromJson(data)).toList();
  } else {
    throw Exception(FAILED);
  }
}

