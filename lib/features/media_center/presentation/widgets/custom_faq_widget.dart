import 'package:flutter_html/flutter_html.dart';
import '../../../../core/src/app_export.dart';
import '../../data/models/faqs/faqs_model.dart';

class CustomFaqWidget extends StatefulWidget {
  final FaqsModel faq;

  const CustomFaqWidget({super.key, required this.faq});

  @override
  State<CustomFaqWidget> createState() => _CustomFaqWidgetState();
}

class _CustomFaqWidgetState extends State<CustomFaqWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return !isOpen
        ? InkWell(
            onTap: () {
              setState(() {
                isOpen = true;
              });
            },
            child: Container(
              width: 362.w,
              height: 48.w,
              margin: EdgeInsets.symmetric(vertical: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border:
                      Border.all(color: AppColors.primary.withOpacity(0.1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.faq.title ?? "",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle(
                      size: 14,
                      color: AppColors.c090909,
                      weight: FontWeight.w600,
                    ),
                  ),
                  SvgPicture.asset(
                    ImageConstants.dropArrow,
                    width: 10.w,
                    height: 10.h,
                    color: AppColors.c090909,
                  ),
                ],
              ),
            ),
          )
        : Container(
            width: 362.w,
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: AppColors.cBEA235,
                borderRadius: BorderRadius.circular(8.r)),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        isOpen = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.faq.title.toString(),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.textStyle(
                            size: 14,
                            color: AppColors.c090909,
                            weight: FontWeight.w600,
                          ),
                        ),
                        SvgPicture.asset(
                          ImageConstants.arrowUp,
                          width: 10.w,
                          height: 10.h,
                          color: AppColors.c090909,
                        ),
                      ],
                    )),
                Html(
                  data: widget.faq.description ?? "",
                  style: {
                    "p": Style(
                      fontSize: FontSize(14),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NeoSansArabic",
                      // backgroundColor: AppColors.white,
                    ),
                  },
                ),
              ],
            ),
          );
  }
}
