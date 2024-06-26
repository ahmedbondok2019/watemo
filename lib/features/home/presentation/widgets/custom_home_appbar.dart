import 'package:completed/core/common/general_cubit/user/user_cubit.dart';

import '../../../../core/common/widgets/custom_profile_image.dart';
import '../../../../core/src/app_export.dart';

class HomeAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomeAppBar({Key? key,required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.h,
        width: 393.w,
        margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 72.h),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const CustomProfileImage(),
          visualDensity: const VisualDensity(horizontal: -4,vertical: 0),
          title: Row(
            children: [
              SizedBox(
                  width: 225.w,
                  child: Row(
                    children: [
                      Text("${"hello".tr(context)}${context.read<UserCubit>().user!.name ?? ""} ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textStyle(
                            weight: FontWeight.w600,
                            color: AppColors.c090909,
                            size: 16),
                      ),

                      Image.asset(ImageConstants.hand, width: 18.w, height: 18.h)
                    ],
                  )
              ),
            ],
          ),
          subtitle: Text(
            "happy_to_see".tr(context),
            style: AppTextStyles.textStyle(
                weight: FontWeight.w600,
                color: AppColors.c090909,
                size: 12),
          ),
          trailing: AppConstants.userType == AppConstants.user ||
              AppConstants.userType == AppConstants.company
              ? const NotificationIcon()
              : CustomDrawerIcon(
            onTap: ()=> scaffoldKey.currentState?.openDrawer(),
          ),
        ));
  }
}
