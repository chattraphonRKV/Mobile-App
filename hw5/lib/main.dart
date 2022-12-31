import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(150, (i) => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i+1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatefulWidget {
  final List<String> items;
  const MyApp({super.key, required this.items});
  @override
  State<StatefulWidget> createState() {
    return _FavoriteWidget (items : items);
  } 
}

class _FavoriteWidget extends State<MyApp>{
  final List<String> items;
  int countfavorite = 0;
  List<bool> isfavorite = List<bool>.generate(150, (index) => false);
  _FavoriteWidget({required this.items});
  @override
  Widget build(BuildContext context) {
    const title = 'Pokemon List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: countfavorite == 0 ? Text(title):Text(title+'($countfavorite)')),
        body: ListView.builder(
          itemCount: items.length ~/ 3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(child: Stack( // Stack is for overlaying Favorite icon on top of image
                  children: [
                    Image.network(items[index*3]),
                    IconButton(onPressed: (() {
                      setState(() {
                        if(isfavorite[index*3] == false){
                          isfavorite[index*3] = true;
                          countfavorite +=1;
                        }
                        else{
                          isfavorite[index*3] = false;
                          countfavorite -=1;
                        }
                      });
                    }), icon: (isfavorite[index*3]
                            ? const Icon(Icons.favorite, size: 50,color: Colors.red,)
                            : const Icon(Icons.favorite_border, size: 50,)))
                  ],
                )),
                Expanded(child: Stack(
                  children: [
                    Image.network(items[index*3+1]),
                    IconButton(onPressed: (() {
                      setState(() {
                        if(isfavorite[index*3+1] == false){
                          isfavorite[index*3+1] = true;
                          countfavorite +=1;
                        }
                        else{
                          isfavorite[index*3+1] = false;
                          countfavorite -=1;
                        }
                      });
                    }), icon: (isfavorite[index*3+1]
                            ? const Icon(Icons.favorite, size: 50,color: Colors.red,)
                            : const Icon(Icons.favorite_border, size: 50,)))
                  ],
                )),
                Expanded(child: Stack(
                  children: [
                    Image.network(items[index*3+2]),
                    IconButton(onPressed: (() {
                      setState(() {
                        if(isfavorite[index*3+2] == false){
                          isfavorite[index*3+2] = true;
                          countfavorite +=1;
                        }
                        else{
                          isfavorite[index*3+2] = false;
                          countfavorite -=1;
                        }
                      });
                    }), icon: (isfavorite[index*3+2]
                            ? const Icon(Icons.favorite, size: 50,color: Colors.red,)
                            : const Icon(Icons.favorite_border, size: 50,))),
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}