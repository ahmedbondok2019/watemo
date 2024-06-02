import '../../../../core/src/app_export.dart';
import '../../data/models/videos/videos_model.dart';
import 'custom_video_widget.dart';

class CustomVideosList extends StatelessWidget {
  final List<VideosModel> videos;

  const CustomVideosList({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: videos.map((video) =>
          CustomVideoWidget(video: video)).toList(),
    );
  }
}
