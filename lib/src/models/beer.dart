class Beer {
  int id;
  String name;
  String tagline;
  String description;
  String image_url;

  Beer.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        tagline = jsonMap['tagline'],
        description = jsonMap['description'],
        image_url = jsonMap['image_url'];

  @override
  String toString() {
    return "{id: ${id}, name: ${name}, tagline: ${tagline}, description: ${description}, image_url: ${image_url},}";
  }
}