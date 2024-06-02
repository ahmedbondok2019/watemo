import 'dart:developer';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/services_cubit.dart';
import '../../data/models/services/services_model.dart';

class CustomBottomSheetListService extends StatefulWidget {
  final List<ServicesModel> servicesList;
  final List<ServicesModel> selectServicesList;
  const CustomBottomSheetListService({super.key,
    required this.servicesList,
    required this.selectServicesList,
  });
  @override
  State<CustomBottomSheetListService> createState() => _CustomBottomSheetListServiceState();
}
class _CustomBottomSheetListServiceState extends State<CustomBottomSheetListService> {
  List<ServicesModel> selectServicesList = [];

  @override
  void initState() {
    selectServicesList = widget.selectServicesList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(10.h),
        ListView.builder(
          scrollDirection: Axis.vertical,
          clipBehavior: Clip.none,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: widget.servicesList.length,
          itemBuilder: (context, i) {
            final service = widget.servicesList[i];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              width: 365.w,
              height: 90.h,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: const Offset(0, 0))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: CustomNetworkImage(
                            imageUrl: service.image!,
                            fit: BoxFit.cover,
                            width: 65.w,
                            height: 76.h,
                          ),
                        ),
                        Gap(5.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 185.w,
                              child: Text(
                                service.title ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.textStyle(
                                    weight: FontWeight.w500,
                                    color: AppColors.c090909,
                                    size: 16),
                              ),
                            ),
                            Gap(10.h),
                            Row(
                              children: [
                                Text(
                                  service.price.toString(),
                                  textDirection: TextDirection.ltr,
                                  style: AppTextStyles.textStyle(
                                      weight: FontWeight.w700,
                                      color: AppColors.c090909,
                                      size: 16),
                                ),
                                Gap(5.w),
                                Text(
                                  "ريال ",
                                  style: AppTextStyles.textStyle(
                                      weight: FontWeight.w400,
                                      color: AppColors.c090909,
                                      size: 13),
                                ),
                              ],
                            )
                          ],
                        ),
                      ]),

                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          if(selectServicesList.isEmpty){
                            log("if ========>>>>>>>>> ");
                            widget.servicesList[i].counter += 1;
                            selectServicesList.add(widget.servicesList[i]);
                          }
                          else{
                            int ind = selectServicesList.indexOf(widget.servicesList[i]);
                            if(ind == -1){
                              widget.servicesList[i].counter += 1;
                              selectServicesList.add(widget.servicesList[i]);
                            }else{
                              widget.servicesList[i].counter = widget.servicesList[i].counter + 1;
                              log("else counter========>>>>>>>>>${widget.servicesList[i].counter} ");
                            }
                          }
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          ImageConstants.plusIcon,
                          width: 25.w,
                          height: 25.h,
                          color: AppColors.primary,
                        ),
                      ),
                      Gap(10.w),
                      Text(
                        widget.servicesList[i].counter.toString(),
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w700,
                            color: AppColors.primary,
                            size: 14),
                      ),
                      Gap(10.w),
                      InkWell(
                        onTap: (){
                          if(selectServicesList.isNotEmpty && widget.servicesList[i].counter != 0){
                            int ind = selectServicesList.indexOf(
                                widget.servicesList[i]);
                            if(ind != -1){
                              widget.servicesList[i].counter = widget.servicesList[i].counter - 1;
                              if(widget.servicesList[i].counter == 0){
                                selectServicesList.removeAt(ind);
                              }
                            }
                          }
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          ImageConstants.minusIcon,
                          width: 25.w,
                          height: 25.h,
                          color: widget.servicesList[i].counter == 0
                              ? AppColors.primary.withOpacity(0.4)
                              : AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        Gap(20.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButtonInternet(
                height: 48,
                width: 172,
                horizontal: 0,
                title: "التالي",
                onTap: () {
                  ServicesCubit.get(context).changeSelectService(
                      selectServicesList);
                  Navigator.pop(context);
                }
            ),
            CustomButtonInternet(
              height: 48,
              width: 172,
              horizontal: 0,
              colorBg: AppColors.white,
              txtColor: AppColors.c090909,
              borderColor: AppColors.c090909,
              title: "الغاء",
              onTap: () => Navigator.pop(context),
            ),
          ],
        )
      ],
    );
  }
}