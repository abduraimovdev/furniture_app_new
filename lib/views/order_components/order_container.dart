import 'package:flutter/material.dart';
import 'package:furniture_app/controllers/order_controller.dart';
import 'package:furniture_app/services/constants/colors.dart';
import 'package:furniture_app/services/constants/strings.dart';
import 'package:furniture_app/services/l10n/app_localization.dart';
import 'package:furniture_app/services/theme/text_styles.dart';

import 'detail_button.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final navController=OrderController();
    return Container(
      height: height * .21,
      width: width * .89,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.cFFFFFF),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * .018,
            ),

            ///# Order and data
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  l10n.orderNo,
                  style: AppTextStyles.nunitoSansBold16
                      .copyWith(color: AppColors.c303030),
                ),
                Text(
                  l10n.data,
                  style: AppTextStyles.nunitoSansSemiBold16
                      .copyWith(color: AppColors.c909090),
                ),
              ],
            ),
            Divider(
              color: AppColors.cF0F0F0,
              thickness: 2,
              height: height * .0363,
            ),

            ///# quantity and amount Total
            Row(
              children: [
                SizedBox(
                  width: width * .0683,
                ),
                Text(
                  l10n.quantity,
                  style: AppTextStyles.nunitoSansSemiBold16
                      .copyWith(color: AppColors.c909090),
                ),
                Text(
                  l10n.quantityNum,
                  style: AppTextStyles.nunitoSansBold16
                      .copyWith(color: AppColors.c303030),
                ),
                SizedBox(
                  width: width * .119,
                ),
                Text(
                  l10n.totalAmount,
                  style: AppTextStyles.nunitoSansSemiBold16
                      .copyWith(color: AppColors.c909090),
                ),
                Text(
                  l10n.price,
                  style: AppTextStyles.nunitoSansBold16
                      .copyWith(color: AppColors.c303030),
                ),
              ],
            ),
            SizedBox(
              height: width * .03,
            ),

            ///#button and delivered
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailButton(
                  onPressed: ()=> navController.goToDetail(context),
                ),
                SizedBox(
                  width: width * .37,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height * .0157,
                    ),
                    Text(
                      l10n.delivered,
                      style: AppTextStyles.nunitoSansSemiBold16
                          .copyWith(color: AppColors.c27AE60),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
