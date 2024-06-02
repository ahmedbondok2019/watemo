import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/src/app_export.dart';

class CustomVideoWidget extends StatefulWidget {
  final String video;
  final String? title;
  final double? height;
  final double? width;

  const CustomVideoWidget({
    super.key,
    required this.video,
    required this.title,
    this.height,
    this.width,
  });

  @override
  State<CustomVideoWidget> createState() => _CustomVideoWidgetState();
}

class _CustomVideoWidgetState extends State<CustomVideoWidget> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    print("video =========>>>>> ${widget.video}");
    super.initState();
    setState(() {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(EndPoints.baseVideoUrl + widget.video),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: 16/10,
        autoPlay: false,
        looping: false,
        allowFullScreen: false,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.primary,
          handleColor: AppColors.primary,
          bufferedColor: AppColors.white,
          backgroundColor: AppColors.transparent,
        ),
      );
      _controller.initialize();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
    decoration: BoxDecoration(
    color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: (widget.height ?? 150).h,
          width: (widget.width ?? 205).w,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.r)),
          child: Chewie(
              controller: _chewieController)),

        Gap(10.h),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            widget.title.toString(),
            style: AppTextStyles.textStyle(
                weight: FontWeight.w600,
                size: 14,
                color: AppColors.c090909),
          ),
        ),

        Gap(10.h),
      ],
    ));
  }
}
