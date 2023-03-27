class Game {
  int? gameId;
  String? name;
  double? price;
  int? publisherId;
  String? genre;

  Game({this.gameId,this.name,this.price,this.publisherId,this.genre});

  Game.fromJson(Map<String, dynamic> json) {
    gameId = json['gameId'];
    name = json['name'];
    price = json['price'];
    publisherId = json['publisherId'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gameId'] = this.gameId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['publisherId'] = this.publisherId;
    data['genre'] = this.genre;
    return data;
  }
}
