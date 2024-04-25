import '../../../../core/common/widgets/custom_network_image.dart';
import '../../../../core/src/app_export.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 393.w,
      margin: EdgeInsets.only(
        left: 15.w,right: 15.w,top: 72.h
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 48.w,height: 48.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CustomNetworkImage(
            imageUrl: EndPoints.baseImageUrl +
                context.read<HomeCubit>()
                    .user!.image!,
            fit: BoxFit.fill,
            height: 164.h,
            width: 361.w,
          ),
        ),
        title: Row(
          children: [
            Text(
              "اهلا ${context.read<HomeCubit>()
                  .user!.name ?? ""} ",
              style: AppTextStyles.textStyle(
                  weight: FontWeight.w600,
                  color: AppColors.c090909, size: 16),
            ),
            Image.asset(ImageConstants.hand,width: 18.w,height: 18.h)
          ],
        ),
        subtitle: Text(
          "سعداء برويتك مرة اخري",
          style: AppTextStyles.textStyle(
              weight: FontWeight.w600,
              color: AppColors.c090909,
              // color: AppColors.c9A9A9A,
              size: 12),
        ),
        trailing: const NotificationIcon(),
      )
    );
  }
}