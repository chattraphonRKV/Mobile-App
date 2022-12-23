import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI',
      home : Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () { }, icon: Icon(Icons.arrow_back_ios_new),color:Color(0xfffdc4d2)),
        title: Center(child: Text('Chaing Mai'),),
        backgroundColor: Color(0xff2e2e2e),
        actions: [Icon(Icons.ios_share,color: Color(0xfffdc4d2),),Icon(Icons.favorite_border,color: Colors.white,)]
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: <Widget>[Image.asset(
              'image/img1.jpg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'image/img2.jpg',
              fit: BoxFit.cover,
            ),
          ],
              onPageChanged: (value) {
            print('Page changed: $value');
          },
           autoPlayInterval: 3000,
           isLoop: true,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('UNESCO Sustainable Teavel Pledge',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                )),
                Text('Shangri-La Chaing Mai',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30
                    )
                )
              ],
            ),
            Row(
                children: <Widget> [
                IconButton(onPressed: () { }, icon: Icon(Icons.star),color : Colors.grey),
                IconButton(onPressed: () { }, icon: Icon(Icons.star),color : Colors.grey),
                IconButton(onPressed: () { }, icon: Icon(Icons.star),color : Colors.grey),
                IconButton(onPressed: () { }, icon: Icon(Icons.star),color : Colors.grey),
                IconButton(onPressed: () { }, icon: Icon(Icons.star),color : Colors.grey),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Luxury hotel with free water park,near Chaing Mai Night Bazaar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),),
                Text('9.0/10 Superb',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30
                ),),
                Text('1,000 verified Hotels.com guest reviews',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),)
              ],
            ),
            Row(
              children: <Widget>[
                Text('See all 1,000 review',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 16
                ),),
                IconButton(onPressed: () { } , icon: Icon(Icons.arrow_forward_ios),color: Colors.cyan,)
              ],
            ),
            Text('Popular amenities',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30
            ),),
            
            Row(children: [
              Expanded(child:
              Column(children: [
                Row(
                  children: [
                    IconButton(onPressed: () { }, icon: Icon(Icons.wifi)),Text('Free WiFi'),
                  ],
                ),
                 Row(
                  children: [
                    IconButton(onPressed: () { }, icon: Icon(Icons.ac_unit_outlined)),Text('Air Conditioning'),
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: () { }, icon: Icon(Icons.fitness_center)), Text('Gym'),
                  ],
                ),
              ],) 
              ),
              Expanded(child: 
              Column(children: [
                Row(
                  children: [
                    IconButton(onPressed: () { }, icon: Icon(Icons.pool)), Text('Pool'),
                  ],
                ),
                 Row(
                  children: [
                    IconButton(onPressed: () { }, icon: Icon(Icons.directions_car)),Text('Free parking')
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: () { }, icon: Icon(Icons.thermostat)),Text('Refrigerator')
                  ],
                ),
              ],) )
            ],),
            
            Column(
              children: <Widget>[
                Image.asset("image/map.jpg"),
              ],)
          ],
        ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
              },
          child : Container(
            height: 50.0,
            width: 420* 0.92,
            decoration: BoxDecoration(
                color: Color.fromRGBO(169, 207, 245, 1),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                'Select a room',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Colors.black),
              ),
            ),
          ),
        ),
  ));
  }
}




