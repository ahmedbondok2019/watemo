
import '../../src/app_export.dart';

class SearchField extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final Function function;
  final String hintText;
  const SearchField({
    Key? key,
    required this.controller,
    required this.function,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 335.w,
        height: 47.h,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.015,
        ),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          keyboardType: TextInputType.text,
          onChanged: (value) {
            function(value);
          },
          controller: controller,
          style: const TextStyle(color: AppColors.cF6E5C3),
          cursorColor: AppColors.cF6E5C3,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: SizedBox(
                child: Image.asset(
                  ImageConstants.search,
                  height: 19.h,
                  width: 19.w,
                  scale: 3.5,
                ),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: AppColors.cF6E5C3)),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
