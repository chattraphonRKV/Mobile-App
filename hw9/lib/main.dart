import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ImagePlayerScreen()));
}

class ImagePlayerScreen extends StatefulWidget {
  const ImagePlayerScreen({super.key});

  @override
  State<ImagePlayerScreen> createState() => _ImagePlayerScreen();
}

class _ImagePlayerScreen extends State<ImagePlayerScreen> {
   final List<String> imageList = [
    "image/ben.jpg",
    "image/eunwoo.jpg",
    "image/jam.jpg",
    "image/jinwoo.jpg",
    "image/will.jpg",
  ];
  List<String> nameList = [
    "Bently",
    "Eunwoo",
    "JamJam",
    "Jinwoo",
    "William",
  ];
  List<String> hour =[
    "5.43 mins",
    "3.23 mins",
    "6.57 mins",
    "2.26 mins",
    "5.44 mins"
  ];
  List<String> video =[
    "video/ben.mp4",
    "video/eunwoo.mp4",
    "video/jam.mp4",
    "video/jinwoo.mp4",
    "video/will.mp4",
  ];
  @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Youtube Demo"),
    ),
    body: ListView.builder(
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: (){
         Navigator.push(context, MaterialPageRoute(
          builder: (_) => VideoPlayerScreen(title: nameList[index], video: video[index]))
);
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ Image.asset(imageList[index]),
            Row(children: [
              Icon(Icons.account_circle),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ Text(nameList[index],style: TextStyle(color: Colors.black,fontSize: 17,)),
                Text("Username."+hour[index],style: TextStyle(color: Colors.black,fontSize: 17,))
              ],)
            ],)]
            ),
        ),
      );
    }
  ),
  );
}
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.title, required this.video});
  final String title;
  final String video;
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}


class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.video);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ));
  }
  
 
}
