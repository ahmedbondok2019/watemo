import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/src/app_export.dart';
import '../../data/models/videos/videos_model.dart';

class CustomVideoWidget extends StatefulWidget {
  final VideosModel video;
  const CustomVideoWidget({super.key, required this.video});
  @override
  State<CustomVideoWidget> createState() => _CustomVideoWidgetState();
}
class _CustomVideoWidgetState extends State<CustomVideoWidget> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.video.url!) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        showLiveFullscreenButton: false,
        enableCaption: false,
        useHybridComposition: false
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363.w,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r)),
      child: YoutubePlayer(
        controller: _controller!,
        width: 363.w,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.primary,
        progressColors: const ProgressBarColors(
          playedColor: AppColors.primary,
          handleColor: AppColors.baleGreen,
        ),
      ),
    );
  }
}