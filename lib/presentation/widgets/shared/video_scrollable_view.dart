import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // builder -> bajo demanda
      scrollDirection: Axis.vertical,
      // physics: const NeverScrollableScrollPhysics(), // no scroll
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        final videoPost = videos[index];

        return Stack(children: [
          // VideoPlayer + gradiente
          SizedBox.expand(
            child: FullScreenWidget(
              caption: videoPost.caption,
              videoUrl: videoPost.videoUrl,
            ),
          ),

          // Buttons
          Positioned(
              bottom: 50, right: 20, child: VideoButtons(video: videoPost)),
        ]);
      }, // scroll android
    );
  }
}
