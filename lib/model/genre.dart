// model for all Genre
class GenreModel {
  int id;
  String name;
  String slug;
  int gamesCount;
  String imageBackground;

  GenreModel({
    this.id,
    this.slug,
    this.name,
    this.gamesCount,
    this.imageBackground,
  });

  factory GenreModel.fromMap(Map<String, dynamic> jsonData) {
    return GenreModel(
      id: jsonData["id"],
      slug: jsonData["slug"],
      name: jsonData["name"],
      gamesCount: jsonData["games_count"],
      imageBackground: jsonData["image_background"],
    );
  }

}
