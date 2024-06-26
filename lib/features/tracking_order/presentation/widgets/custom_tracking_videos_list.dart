import '../../../../core/common/widgets/custom_video_widget.dart';
import '../../../../core/src/app_export.dart';
import '../../data/models/steps/steps_model.dart';

class CustomTrackingVideosList extends StatelessWidget {
  final List<StepsModel> videos;
  const CustomTrackingVideosList({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: videos.length,
      itemBuilder: (context, i) {
        return videos[i].video == null || videos[i].video!.isEmpty
            ? const SizedBox()
            : CustomVideoWidget(
            video: videos[i].video.toString(),
            title: videos[i].text.toString()
        );
      },
    );
  }
}
