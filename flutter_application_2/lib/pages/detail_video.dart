import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailVideo extends StatefulWidget {
  final String videoUrl;

  const DetailVideo({required this.videoUrl});

  @override
  // ignore: no_logic_in_create_state
  State<DetailVideo> createState() => _DetailVideoState(videoUrl);
}

class _DetailVideoState extends State<DetailVideo> {

  final String videoUrl;
  _DetailVideoState(this.videoUrl);

  late VideoPlayerController playerController;

  @override
  void initState() {
    super.initState();
    playerController = VideoPlayerController.network(videoUrl)
    ..addListener(() => setState((){}))
    ..setLooping(true)
    ..initialize().then((value) => playerController.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu
            ),
            SizedBox(
              width: 20
            ),
            Text(
              'Recipe Videos'
            ),
          ],
        ),
      ),
      body: Center(
        child: Center(
          child: playerController.value.isInitialized 
          ? AspectRatio(
            aspectRatio: playerController.value.aspectRatio,
            child: VideoPlayer(playerController),
          )
          : Container(),
        ),
      ),
    );
  }
}