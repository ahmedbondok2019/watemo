import '../../../../core/src/app_export.dart';
import '../../data/models/faqs/faqs_model.dart';
import 'custom_faq_widget.dart';

class CustomFaqsList extends StatelessWidget {
  final List<FaqsModel> faqs;

  const CustomFaqsList({super.key, required this.faqs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: faqs.length,
      itemBuilder: (context, i) {
        final faq = faqs[i];
        return CustomFaqWidget(faq: faq);
      },
    );
  }
}
