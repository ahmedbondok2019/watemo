import '../../../../core/common/widgets/build_upload_photo_sheet.dart';
import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';
import '../../cubit/profile_cubit.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocBuilder<ProfileCubit,
        ProfileState>(builder: (context, state) {
      return InkWell(
        splashColor: AppColors.transparent,
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) =>
                  BuildUploadPhotoSheet(
                    onCameraTap: () {
                      Navigator.of(context).pop();
                      profileCubit.setCameraImages();
                    },
                    onGalleryTap: () {
                      Navigator.of(context).pop();
                      profileCubit.setGalleryImages();
                    },
                  ));
        },
        child: profileCubit.myImage != null ||
            profileCubit.imageProfileNet != null
            ? Stack(
          children: [
            Container(
              width: 144.w,
              height: 144.h,
              margin: EdgeInsets.only(bottom: 10.h),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: profileCubit.myImage != null
                  ? Image.file(
                profileCubit.myImage!,
                fit: BoxFit.fill,
              )
                  : profileCubit.imageProfileNet != null
                  ? CustomNetworkImage(
                imageUrl:
                    profileCubit.user!.image!,
                fit: BoxFit.fill,
                width: 144.w,
                height: 144.h,
              )
                  : null,
            ),
            Positioned(
                bottom: 15.h,
                right: 15.w,
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  padding: EdgeInsets.all(5.w),
                  decoration: const BoxDecoration(
                      color: AppColors.white, shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    ImageConstants.edit,
                    fit: BoxFit.fill,
                  ),
                ))
          ],
        )
            : Container(
          width: 144.w,
          height: 144.h,
          margin: EdgeInsets.only(bottom: 5.h),
          child: Image.asset(
            ImageConstants.editPhoto,
            fit: BoxFit.contain,
          ),
        ),
      );
    });
  }
}
