import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ruligames/components/button.dart';
import 'package:ruligames/components/sign_up_button.dart';
import 'package:ruligames/components/text_field.dart';
import 'package:ruligames/models/user.dart';
import 'package:ruligames/models/game.dart';
import 'package:ruligames/pages/add_balance_page.dart';
import 'package:ruligames/pages/login_page.dart';

import '../components/add_game_button.dart';
import 'add_game_page.dart';

class AdminHomePage extends StatefulWidget {
  final User userGlobal;
  const AdminHomePage({super.key, required this.userGlobal});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  Future<List<Game>> fetchGames() async {
    String url = 'http://10.0.2.2:8080/homepage/getGames';
    final client = Client();
    final Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Game> gameList = [];
      List gamesJson = json.decode(response.body);
      for(var u in gamesJson){
        Game game = new Game();
        game.gameId=u["gameId"];
        game.genre=u["genre"];
        game.publisherId=u["publisherId"];
        game.name=u["name"];
        game.price=u["price"];
        gameList.add(game);
      }
      print(gameList);
      return gameList;
    } else {
      throw Exception('Failed to fetch games');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text('Ruli Games',style: TextStyle(color: Colors.amber[100])),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AddGame(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AddGamePage(userGlobal: widget.userGlobal)));}),
                    ],
                  ),
                )
            ),
          ]
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: FutureBuilder(
            future: fetchGames(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    Game game = snapshot.data![index];
                    return Card(
                      color: Colors.purple[800],
                      child: Column(
                        children: <Widget>[
                          Text(game.name.toString(), style: TextStyle(color: Colors.amber[100], fontSize: 25),),
                          Text("Genre: " + game.genre.toString(), style: TextStyle(color: Colors.amber[100], fontSize: 25),),
                          Text("Price: " + game.price.toString()+" \$", style: TextStyle(color: Colors.amber[100], fontSize: 25),),
                          ElevatedButton(
                              onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("You are at work! No time for playing games!")));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white38),
                              ),
                              child: Text(
                                "Buy Now",
                                style: TextStyle(color: Colors.purple[800], fontWeight: FontWeight.bold, fontSize: 18),
                              ))
                        ],
                      ),
                    );
                  },
                );
              }else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}