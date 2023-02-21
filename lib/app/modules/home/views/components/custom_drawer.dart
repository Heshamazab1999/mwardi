import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mwardi/app/common/app_colors.dart';
import 'package:mwardi/app/common/app_text_styles.dart';
import 'package:mwardi/app/modules/home/controllers/home_controller.dart';
import 'package:mwardi/app/routes/app_pages.dart';

import '../../../../common/components/dialog.dart';
import 'item_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer

  ({super.key});

  static final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Container(
        width: w * 0.8,
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  Obx(() => CircleAvatar(
                        radius: 20,
                        child: CachedNetworkImage(
                          imageUrl: _homeController
                                  .userData.value?.employee?.profile ??
                              "",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hani Hussein",
                        style: AppTextStyles.blackTextStyle
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Mobile App developer",
                        style: AppTextStyles.blackTextStyle.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 13.0),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    // onPressed: () async {
                    //   showDialog1(context);
                    //   await _homeController.logOut();
                    // },
                      onPressed: () => Get.toNamed(Routes.SETTINGS),
                      icon: const Icon(Icons.settings))
                ],
              ),
            ),
            Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: _homeController.drawerScreens.length,
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 20),
                  itemBuilder: (context, index) =>
                      Obx(
                            () =>
                            ItemTile(
                              index: index,
                              name: _homeController.drawerScreens[index][0],
                              selected: _homeController.drawerPage.value == index,
                              // action: _homeController.jumpToSidePage,
                              onTap:(){
                                if(index + 1 ==  _homeController.drawerScreens.length){
                                  showDialog1(context);
                                  _homeController.logOut();
                                  print('logged out');

                                }else{
                                  print('else');

                                  _homeController.jumpToSidePage(index);
                                }

                              },

                              isLogout: index + 1 ==
                                  _homeController.drawerScreens.length,
                              icon: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadiusDirectional.horizontal(
                                          end: Radius.circular(20)),
                                      color: _homeController.drawerPage.value ==
                                          index
                                          ? AppColors.secondaryColor
                                          : Colors.transparent),
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      15, 8, 10, 8),
                                  child: Icon(
                                    _homeController.drawerScreens[index][1],
                                    color: index + 1 ==
                                        _homeController.drawerScreens.length
                                        ? AppColors.redColor
                                        : _homeController.drawerPage.value ==
                                        index
                                        ? AppColors.whiteColor
                                        : AppColors.greyColor,
                                  )),
                            ),
                      ),
                ))
          ],
        ),
      ),
    );
  }

}
