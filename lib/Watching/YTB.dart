import 'dart:developer';
import 'package:flutter/cupertino.dart';
import '../Model/CategoryImage.dart';
import '../Model/Subjects.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';

import '../HomePage_TabView_Movie.dart';
import 'Comment.dart';
import 'Detail.dart';
import 'Ratting.dart';

class PlayYTB extends StatefulWidget {
  // final List listP;
  // PlayYTB(this.listP);
  @override
  _PlayYTBState createState() => _PlayYTBState();
}

class _PlayYTBState extends State<PlayYTB> {
  YoutubePlayerController _controllerYTB;
  List<Subjects> listSubject = [];
  ScrollController controller;
  var idYTB = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=0jbyqYl4y1I");
  @override
  void initState() {
    // String YTBPlay = YoutubePlayerController.convertUrlToId("https://www.youtube.com/watch?v=yV2m7M34X3Y");
    // print(YTBPlay + " 1234321");
    // TODO: implement initState
    super.initState();

    // widget._controllerYTB = YoutubePlayerController(
    //   initialVideoId: 'yV2m7M34X3Y',
    //   params: YoutubePlayerParams(
    //     playlist: ['yV2m7M34X3Y', 'gQDByCdjUXw'], // Defining custom playlist
    //     showControls: true,
    //     showFullscreenButton: true,
    //     desktopMode: true,
    //     privacyEnhanced: true,
    //     useHybridComposition: true,
    //
    //
    //   ),
    // );
    // widget._controllerYTB.onEnterFullscreen = () {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.landscapeLeft,
    //     DeviceOrientation.landscapeRight,
    //   ]);
    //   log('Entered Fullscreen');
    // };

    _controllerYTB = YoutubePlayerController(
        initialVideoId: idYTB,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controllerYTB.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerYTB.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controllerYTB,
        topActions: [
          FullScreenButton(
            color: Colors.pink,
          )
        ],
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Youtube Player Flutter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.black38,
          child: Column(
            children: [
              player,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListView(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                DetailWatchingYTB(),
                              ],
                            ),
                          ),
                          SingleChildScrollView(child: DetailWatchingYTB()),
                          SingleChildScrollView(child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.89,
                            child: Column(
                              children: [
                                Ratting(),
                                CustomComment(),
                              ],
                            ),
                          )),
                        ]),
                  ),
                ),
              )

              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     _space,
              //     _text('Title', _videoMetaData.title),
              //     _space,
              //     _text('Channel', _videoMetaData.author),
              //     _space,
              //     _text('Video Id', _videoMetaData.videoId),
              //     _space,
              //     Row(
              //       children: [
              //         _text(
              //           'Playback Quality',
              //           _controller.value.playbackQuality ?? '',
              //         ),
              //         const Spacer(),
              //         _text(
              //           'Playback Rate',
              //           '${_controller.value.playbackRate}x  ',
              //         ),
              //       ],
              //     ),
              //     _space,
              //     TextField(
              //       enabled: _isPlayerReady,
              //       controller: _idController,
              //       decoration: InputDecoration(
              //         border: InputBorder.none,
              //         hintText: 'Enter youtube \<video id\> or \<link\>',
              //         fillColor: Colors.blueAccent.withAlpha(20),
              //         filled: true,
              //         hintStyle: const TextStyle(
              //           fontWeight: FontWeight.w300,
              //           color: Colors.blueAccent,
              //         ),
              //         suffixIcon: IconButton(
              //           icon: const Icon(Icons.clear),
              //           onPressed: () => _idController.clear(),
              //         ),
              //       ),
              //     ),
              //     _space,
              //     Row(
              //       children: [
              //         _loadCueButton('LOAD'),
              //         const SizedBox(width: 10.0),
              //         _loadCueButton('CUE'),
              //       ],
              //     ),
              //     _space,
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         IconButton(
              //           icon: const Icon(Icons.skip_previous),
              //           onPressed: _isPlayerReady
              //               ? () => _controller.load(_ids[
              //           (_ids.indexOf(_controller.metadata.videoId) -
              //               1) %
              //               _ids.length])
              //               : null,
              //         ),
              //         IconButton(
              //           icon: Icon(
              //             _controller.value.isPlaying
              //                 ? Icons.pause
              //                 : Icons.play_arrow,
              //           ),
              //           onPressed: _isPlayerReady
              //               ? () {
              //             _controller.value.isPlaying
              //                 ? _controller.pause()
              //                 : _controller.play();
              //             setState(() {});
              //           }
              //               : null,
              //         ),
              //         IconButton(
              //           icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
              //           onPressed: _isPlayerReady
              //               ? () {
              //             _muted
              //                 ? _controller.unMute()
              //                 : _controller.mute();
              //             setState(() {
              //               _muted = !_muted;
              //             });
              //           }
              //               : null,
              //         ),
              //         FullScreenButton(
              //           controller: _controller,
              //           color: Colors.blueAccent,
              //         ),
              //         IconButton(
              //           icon: const Icon(Icons.skip_next),
              //           onPressed: _isPlayerReady
              //               ? () => _controller.load(_ids[
              //           (_ids.indexOf(_controller.metadata.videoId) +
              //               1) %
              //               _ids.length])
              //               : null,
              //         ),
              //       ],
              //     ),
              //     _space,
              //     Row(
              //       children: <Widget>[
              //         const Text(
              //           "Volume",
              //           style: TextStyle(fontWeight: FontWeight.w300),
              //         ),
              //         Expanded(
              //           child: Slider(
              //             inactiveColor: Colors.transparent,
              //             value: _volume,
              //             min: 0.0,
              //             max: 100.0,
              //             divisions: 10,
              //             label: '${(_volume).round()}',
              //             onChanged: _isPlayerReady
              //                 ? (value) {
              //               setState(() {
              //                 _volume = value;
              //               });
              //               _controller.setVolume(_volume.round());
              //             }
              //                 : null,
              //           ),
              //         ),
              //       ],
              //     ),
              //     _space,
              //     AnimatedContainer(
              //       duration: const Duration(milliseconds: 800),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20.0),
              //         color: _getStateColor(_playerState),
              //       ),
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //         _playerState.toString(),
              //         style: const TextStyle(
              //           fontWeight: FontWeight.w300,
              //           color: Colors.white,
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
