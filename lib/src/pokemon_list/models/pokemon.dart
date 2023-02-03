class Pokemon {
  final int id;
  final String name;
  final String url;

  Pokemon({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: int.parse(json['url'].substring(34, json['url'].indexOf('/', 34))),
      name: json['name'][0].toUpperCase() + json['name'].substring(1),
      url: json['url'],
    );
  }
}
