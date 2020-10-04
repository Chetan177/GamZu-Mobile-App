
// model for all game data
class GameModel {
  int id;
  String slug;
  String name;
  int metaCritic;
  String backgroundImg;
  String website;
  String rating;
  String redditURL;

  GameModel({
    this.id,
    this.slug,
    this.name,
    this.metaCritic,
    this.backgroundImg,
    this.website,
    this.rating,
    this.redditURL,
  });

  factory GameModel.fromMap(Map<String, dynamic> jsonData) {
    return GameModel(
      id: jsonData["id"],
      slug: jsonData["slug"],
      name: jsonData["name"],
      metaCritic: jsonData["metacritic"],
      backgroundImg: jsonData["background_image"],
      website: jsonData["website"],
      rating: jsonData["rating"].toString(),
      redditURL: jsonData["reddit_url"],
    );
  }

// List<Platform> platforms;
// List<Store> stores;
}



// Model for store api
class Store {
  int id;
  String url;

  Store({this.id, this.url});

  factory Store.fromMap(Map<String, dynamic> jsonData) {
    return Store(
      id: jsonData["id"],
      url: jsonData["url"],
    );
  }
}

class Platform {
  int id;
  String name;
  String slug;
}