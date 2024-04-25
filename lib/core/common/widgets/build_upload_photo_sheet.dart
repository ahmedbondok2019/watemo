import '../../src/app_export.dart';

class BuildUploadPhotoSheet extends StatelessWidget {
  const BuildUploadPhotoSheet({super.key, this.onGalleryTap, this.onCameraTap});
  final GestureTapCallback? onGalleryTap;
  final GestureTapCallback? onCameraTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: 22.h, right: 16.w, left: 16.w, bottom: 32.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r))),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context)
            .copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: onCameraTap,
                child: Text(
                  "Take Photo",
                  style: AppTextStyles.textStyle(
                    size: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(color: AppColors.c1B273A.withOpacity(0.4),),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: onGalleryTap,
                child: Text(
                  "Gallery",
                  style: AppTextStyles.textStyle(
                    size: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(color: AppColors.c1B273A.withOpacity(0.4),),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: AppTextStyles.textStyle(
                    size: 16,
                    color: AppColors.c1B273A,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}