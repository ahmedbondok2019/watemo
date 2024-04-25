import 'package:completed/core/localization/app_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/image_constants.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.noData, height: 67, width: 67),
          Text(
            'noElementsHeader'.tr(context),
            style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Color(0xff042030)),
          ),
          Text(
            'noElementsBody'.tr(context),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xff585858),
            ),
          )
        ],
      ),
    );
  }
}
