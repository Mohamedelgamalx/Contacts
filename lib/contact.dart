class Contact {
  int? id;
  late String name;
  late String number;
  late String url;

  Contact({
    this.id,
    required this.name,
    required this.number,
    required this.url
  });

  Contact.fromMap(Map<String, dynamic> map) {
    if (map['id'] != null) {
      id = map['id'];
    }
    name = map['name'];
    number = map['number'];
    url = map['url'];
  }

  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = {};
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['number'] = number;
    map['url'] = url;
    return map;
  }
}