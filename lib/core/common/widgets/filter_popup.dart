import 'package:completed/core/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPopup extends StatefulWidget {
  const FilterPopup({Key? key}) : super(key: key);

  @override
  State<FilterPopup> createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  Map<String, List<String>?> filters = {};
  bool needRefresh = false;
  late List<FilterItem> children;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    children = [
      FilterItem('feqh'.tr(context), subitems: [
        FilterItem('islamicFeqh'.tr(context), subitems: [
          FilterItem('all'.tr(context)),
          FilterItem('shafeeiFeqh'.tr(context)),
          FilterItem('hanafyFeqh'.tr(context)),
        ]),
        FilterItem('legalRulings'.tr(context)),
      ]),
      FilterItem('legitimacy'.tr(context), subitems: [
        FilterItem('${'legitimacy'.tr(context)}1', subitems: [
          FilterItem('${'legitimacy'.tr(context)}1'),
          FilterItem('${'legitimacy'.tr(context)}2')
        ]),
        FilterItem('legitimacy'.tr(context), subitems: [
          FilterItem('${'legitimacy'.tr(context)}1'),
          FilterItem('${'legitimacy'.tr(context)}2')
        ])
      ]),
      FilterItem('hadith'.tr(context), subitems: [
        FilterItem('ProfitsTales'.tr(context), subitems: [
          FilterItem('الحديث1'.tr(context)),
          FilterItem('الحديث2'.tr(context)),
        ]),
        FilterItem('hadith'.tr(context), subitems: [
          FilterItem('${'hadith'.tr(context)}1'),
          FilterItem('${'hadith'.tr(context)}2'),
        ]),
      ]),
      FilterItem('ProfitsTales'.tr(context), subitems: [
        FilterItem('${'ProfitsTales'.tr(context)}1'),
        FilterItem('${'ProfitsTales'.tr(context)}2'),
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 120.0.r),
      child: Drawer(
        width: 273.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(12.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'categories'.tr(context),
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF042030)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'deleteAll'.tr(context),
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xFF7A808A)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: List.generate(
                      children.length,
                      (index) => Column(
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    children[index].selected =
                                        !children[index].selected;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.06,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      margin: EdgeInsets.only(bottom: 16.r),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: children[index].selected
                                          ? Icon(
                                              Icons.remove,
                                              size: 20.w,
                                              color: const Color(0xFF585858),
                                            )
                                          : Icon(
                                              size: 20.w,
                                              Icons.add,
                                              color: const Color(0xFF585858),
                                            ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Text(
                                      children[index].text,
                                      style: TextStyle(
                                          color:
                                              children[index].selected == true
                                                  ? const Color(0xFFD19B6F)
                                                  : Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ],
                                ),
                              ),
                              if (children[index].subitems.isNotEmpty)
                                !children[index].selected
                                    ? Container()
                                    : Padding(
                                        padding: EdgeInsets.only(right: 32.0.r),
                                        child: Column(
                                          children:
                                              children[index].subitems.map(
                                            (eChild) {
                                              return Column(
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      setState(() {
                                                        eChild.selected =
                                                            !eChild.selected;
                                                      });
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.06,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.03,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 16.r),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFFD9D9D9),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.r),
                                                          ),
                                                          child: eChild.selected
                                                              ? Icon(
                                                                  Icons.remove,
                                                                  size: 20.w,
                                                                  color: const Color(
                                                                      0xFF585858),
                                                                )
                                                              : Icon(
                                                                  Icons.add,
                                                                  size: 20.w,
                                                                  color: const Color(
                                                                      0xFF585858),
                                                                ),
                                                        ),
                                                        SizedBox(
                                                          width: 15.w,
                                                        ),
                                                        Text(
                                                          eChild.text,
                                                          style: TextStyle(
                                                              color: eChild
                                                                          .selected ==
                                                                      true
                                                                  ? const Color(
                                                                      0xFFD19B6F)
                                                                  : Colors
                                                                      .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 16.sp),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (eChild
                                                      .subitems.isNotEmpty)
                                                    !eChild.selected
                                                        ? Container()
                                                        : Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        25.r),
                                                            child: Column(
                                                              children:
                                                                  List.generate(
                                                                      eChild
                                                                          .subitems
                                                                          .length,
                                                                      (index) =>
                                                                          Row(
                                                                            children: [
                                                                              Radio(
                                                                                value: eChild.subitems[index].selected,
                                                                                activeColor: const Color(0xFFD19B6F),
                                                                                groupValue: true,
                                                                                onChanged: (v) {
                                                                                  setState(() {
                                                                                    eChild.subitems.map((item) => item.selected = false).toList();
                                                                                    eChild.subitems[index].selected = !v!;
                                                                                    print(eChild.subitems[index].text);
                                                                                  });
                                                                                },
                                                                              ),
                                                                              Text(
                                                                                eChild.subitems[index].text,
                                                                                style: TextStyle(
                                                                                  color: eChild.subitems[index].selected == true ? const Color(0xFFD19B6F) : Colors.black,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  fontSize: 16.sp,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )),
                                                            ),
                                                          )
                                                ],
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      )
                            ],
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterItem {
  final String text;
  bool selected;
  List<FilterItem> subitems;

  FilterItem(
    this.text, {
    this.selected = false,
    this.subitems = const [],
  });
}
