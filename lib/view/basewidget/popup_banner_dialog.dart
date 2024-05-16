import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_button.dart';
import 'package:provider/provider.dart';

import '../../provider/banner_provider.dart';
import '../screen/home/widget/footer_banner.dart';

class PopupBannerDialog extends StatelessWidget {
  final bool isFailed;
  final double rotateAngle;

  final String? title;
  final String? description;
  const PopupBannerDialog({Key? key, this.isFailed = false, this.rotateAngle = 0,   this.title,  this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(padding: const EdgeInsets.symmetric(vertical : 5),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 35, width: 35, child: CustomButton(
              radius: 5, buttonText: "X", onTap: () => Navigator.pop(context))),
          SizedBox(height: 10),
          Consumer<BannerProvider>(builder: (context, footerBannerProvider, child){
            return footerBannerProvider.popupBanner != null && footerBannerProvider.popupBanner!.isNotEmpty?
            Padding(padding: const EdgeInsets.only(bottom: 2, left:2, right: 2 ),
                child: SingleBannersView( bannerModel : footerBannerProvider.popupBanner?[0])):const SizedBox();}),


        ]),
      ),
    );
  }
}
