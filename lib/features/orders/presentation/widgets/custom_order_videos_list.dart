import '../../../../core/common/widgets/custom_video_widget.dart';
import '../../../../core/src/app_export.dart';

class CustomOrderVideosList extends StatelessWidget {
  final List<String> videos;
  final List<String> titles;
  final bool isAll;

  const CustomOrderVideosList({super.key,
    required this.videos,
    required this.titles,
    this.isAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return videos.isEmpty
        ? const SizedBox()
        : ListView.builder(
              scrollDirection: isAll ? Axis.vertical : Axis.horizontal,
              clipBehavior: Clip.none,
              shrinkWrap: true,
              physics: isAll
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: videos.length,
              itemBuilder: (context, i) {
                return CustomVideoWidget(
                    video: videos[i].toString(),
                  title: titles[i].toString(),
                  width: isAll ? 370.w : null,
                  height: isAll ? 270.w : null,
                );
              },
          );
  }
}
