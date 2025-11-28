import 'add_category_view.dart';
import '../widgets/search_bar.dart';
import 'package:flutter/material.dart';
import '../../manager/layout_cubit.dart';
import '../widgets/List/categories.dart';
import '../../manager/layout_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/utils/dialog_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LayoutCubit.get(context).clearSearchData();
      LayoutCubit.get(context).clearFilterData();
    });

    final s = S.of(context);
    var cubit = LayoutCubit.get(context);
    return BlocListener<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is FilterState) {
          Navigator.pop(context);
        }
      },
      child: BackGround(
        top: CustomSearchAppBar(
          title: s.categories,
          searchHint: s.categoriesSearchHint,
          applyPressed: () => cubit.filterCategoriesFunc(),
        ),
        body: SingleChildScrollView(child: Categories()),
        floatingActionButton: _CustomFloatingActionButton(),
      ),
    );
  }
}

class _CustomFloatingActionButton extends StatelessWidget {
  const _CustomFloatingActionButton();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        bool searchOpen = LayoutCubit.get(context).searchingOpen;
        return searchOpen
            ? SizedBox.shrink()
            : Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: FloatingActionButton(
                heroTag: "add",
                onPressed: () {
                  final innerContext =
                      context; // context هنا هو بتاع الـ inner dialog

                  DialogServices.showCleanDialog(
                    context: innerContext,
                    barrierDismissible: false,
                    child: AddCategoryView(),
                  );
                },
                backgroundColor: theme.primaryColor,
                child: Icon(Icons.add, size: 28.sp, color: theme.hintColor),
              ),
            );
      },
    );
  }
}
