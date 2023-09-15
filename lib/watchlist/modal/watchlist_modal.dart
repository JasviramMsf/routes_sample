class WatchlistModal {
  final String? id;
  final String? name;
  final String? contacts;
  final String? url;

  const WatchlistModal({
    required this.id,
    required this.name,
    required this.contacts,
    required this.url,
  });

  factory WatchlistModal.fromJson(Map<String, dynamic> json) {
    return WatchlistModal(
        id: json['id'],
        name: json['name'],
        contacts: json['Contacts'],
        url: json['url']);
  }
}
