import 'package:flutter_html/flutter_html.dart';
import '../../../../core/src/app_export.dart';
import '../../data/models/hadith_model.dart';

class CustomHadithList extends StatelessWidget {
  final List<HadithModel> hadithList;

  const CustomHadithList({super.key, required this.hadithList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: hadithList.length,
      itemBuilder: (context, i) {
        final hadith = hadithList[i];
        return Column(
          children: [
            Html(
              data: hadith.hadith ?? "",
              style: {
                "p": Style(
                  fontSize: FontSize(14),
                  fontWeight: FontWeight.w500,
                  fontFamily: "NeoSansArabic",
                  backgroundColor: AppColors.white,
                ),
              },
            ),
            const Divider(color: AppColors.cE2E2E2)
          ],
        );
      },
    );
  }
}
