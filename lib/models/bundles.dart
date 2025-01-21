

class Bundles {
  final int? id;
  final String? name;
  final String? description;
  final String? type;
  final List ? ids;

  Bundles({
    this.id,
    this.name,
    this.description,
    this.ids,
    this.type,
});

 factory Bundles.fromJson(Map<String,dynamic> json){
  return Bundles(
    id : json['id'] ?? 0,
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    type: json['type'] ?? '',
    ids: json['ids'] ?? [],
  );
 }
 
}
