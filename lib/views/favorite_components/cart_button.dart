import 'package:flutter/material.dart';
import 'package:furniture_app/services/l10n/app_localization.dart';

import '../../controllers/favorite_controller.dart';
import '../../services/constants/colors.dart';
import '../../services/constants/strings.dart';
import '../../services/theme/text_styles.dart';

class CartButton extends StatelessWidget {

  const CartButton({
    super.key,
    required this.controller,
  });

  final FavoriteController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ElevatedButton(
      onPressed: () => controller.goToCongrats(context),
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: AppColors.c303030,
        backgroundColor: AppColors.c303030,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(800, 60),
      ),
      child: Text(
        l10n.addAll,
        style: AppTextStyles.nunitoSansSemiBold18.copyWith(
          color: AppColors.cFFFFFF,
        ),
      ),
    );
  }
}
