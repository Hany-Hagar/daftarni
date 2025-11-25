import '../../../../../const/app.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/nav_pop_icon.dart';
import '../../../data/models/category_model.dart';
import '../../widgets/transaction/add_transaction_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionsView extends StatelessWidget {
  final String title;
  final String subTitle;
  final String brief;
  final String amountTitle;
  final VoidCallback? onTap;
  final int categoryIndex;
  final TextEditingController value;
  final List<CategoryModel> categories;
  final dynamic Function(String?)? onChanged;
  final TextEditingController dateController;
  final TextEditingController briefController;

  const AddTransactionsView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.brief,
    required this.onTap,
    required this.value,
    required this.onChanged,
    required this.categories,
    required this.amountTitle,
    required this.categoryIndex,
    required this.dateController,
    required this.briefController,
  });

  @override
  Widget build(BuildContext context) {
    return BackGround(
      top: _AppBar(title: title, subTitle: subTitle),
      body: SingleChildScrollView(
        child: AddTransactionBody(
          brief: brief,
          value: value,
          onTap: onTap,
          onChanged: onChanged,
          categories: categories,
          amountTitle: amountTitle,
          categoryIndex: categoryIndex,
          dateController: dateController,
          briefController: briefController,
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final String title;
  final String subTitle;
  const _AppBar({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: defaultAppBarPadding,
      decoration: BoxDecoration(
        gradient: linearGradient,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(13.r)),
      ),
      child: Row(
        children: [
          NavPopIcon(),
          Spacer(flex: 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                isHead: true,
                title: title,
                fontSize: 30,
                fontColor: Colors.white,
              ),
              CustomText(
                isHead: true,
                title: subTitle,
                fontSize: 25,
                fontColor: Colors.white,
              ),
            ],
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
