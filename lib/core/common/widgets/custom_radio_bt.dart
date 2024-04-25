import '../../src/app_export.dart';

class CustomRadio extends StatefulWidget {
  final int? value;
  final int? groupValue;
  final void Function(int) onChanged;
  const CustomRadio({Key? key, required this.value, required this.groupValue, required this.onChanged})
      : super(key: key);
  @override
  State<CustomRadio> createState() => _CustomRadioState();
}
class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);
    return InkWell(
      onTap: () => widget.onChanged(widget.value!),
      child: Container(
        padding: EdgeInsets.all(1.w),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
          border: Border.all(
              color: selected ? AppColors.primary : AppColors.cCBCBCB,
            width: 1.5
          )
        ),
        child: Icon(
          Icons.circle,
          size: 15,
          color: selected ? AppColors.primary : AppColors.white,
        ),
      ),
    );
  }
}