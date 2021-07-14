import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LastReadCard extends StatelessWidget {


  const LastReadCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: sizeInfo.screenSize.width * .93,
          height: sizeInfo.screenSize.width * .4,
          decoration: BoxDecoration(
              gradient: CustomColors.kgradient,
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Last Read",
                        style: AppTextStyles.LastReadTextStyle.subtitle2),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                top: 70,
                child: Column(
                  children: [
                    Text("Al-Fatiah",
                        style: AppTextStyles.LastReadTextStyle.headline5),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Ayah No:" + "1",
                        style: AppTextStyles.LastReadTextStyle.bodyText1),
                  ],
                ),
              ),
              Positioned(
                bottom: -35,
                right: 0,
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular((60))),
                  child: Image.asset(
                    "assets/images/main_image.png",
                    width: sizeInfo.screenSize.width * .4,
                    height: sizeInfo.screenSize.height * .23,
                    fit: BoxFit.contain,
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