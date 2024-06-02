import '../../src/app_export.dart';
import '../general_cubit/user/user_cubit.dart';
import 'custom_network_image.dart';

class CustomProfileImage extends StatelessWidget {
  final String? image;
  const CustomProfileImage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58.w,
      height: 58.h,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CustomNetworkImage(
        imageUrl: context.read<UserCubit>().user!.image!,
        fit: BoxFit.fill,
      ),
    );
  }
}