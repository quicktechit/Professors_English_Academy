import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class QuickTechYoutubeVideoPlayer extends StatefulWidget {
  final String url;
  const QuickTechYoutubeVideoPlayer({super.key, required this.url});

  @override
  _QuickTechYoutubeVideoPlayer createState() => _QuickTechYoutubeVideoPlayer();
}

class _QuickTechYoutubeVideoPlayer extends State<QuickTechYoutubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(widget.url);
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoId!) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YouTube Player')),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
