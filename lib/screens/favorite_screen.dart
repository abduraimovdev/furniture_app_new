import 'package:flutter/material.dart';
import 'package:furniture_app/controllers/favorite_controller.dart';
import 'package:furniture_app/services/constants/svg_icons.dart';
import 'package:furniture_app/services/constants/colors.dart';
import 'package:furniture_app/services/constants/strings.dart';
import 'package:furniture_app/services/l10n/app_localization.dart';
import 'package:furniture_app/services/theme/text_styles.dart';
import '../services/data/database/products.dart';
import '../views/favorite_components/cart_button.dart';
import '../views/favorite_components/favorite_product_widget.dart';

class FavoriteScreen extends StatefulWidget {
  static const id = "/favorite";

  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final FavoriteController controller;
  late final AppLocalizations l10n;

  @override
  void didChangeDependencies() {
    l10n = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    controller = FavoriteController(updater: setState);
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SvgIcon.search,
          ],
        ),
        title: Text(
          l10n.favorite,
          style: AppTextStyles.merriWeatherBold18.copyWith(
            color: AppColors.c303030,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () => controller.goToCongrats(context),
              child: SvgIcon.cart),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              /// scroll
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.68,
                child: ListView.separated(
                  itemCount: products.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    thickness: 2,
                    height: 24,
                    color: AppColors.cF0F0F0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(
                        index: index,
                        controller: controller,
                        product: products[index]);
                  },
                ),
              ),
              CartButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}