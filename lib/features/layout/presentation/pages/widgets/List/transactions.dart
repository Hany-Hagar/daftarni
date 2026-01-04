// ignore_for_file: deprecated_member_use

import '../custom_icon.dart';
import '../custom_skeletonizer.dart';
import 'package:flutter/material.dart';
import '../../../../../../const_data/data.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/empty.dart';
import '../../../../data/models/transaction_model.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/utils/dialog_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Transactions extends StatelessWidget {
  final bool recentTransaction;
  final List<TransactionModel>? monthlyTransactions;

  const Transactions({
    super.key,
    this.recentTransaction = false,
    this.monthlyTransactions,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        var transactions =
            monthlyTransactions ??
            (recentTransaction
                ? cubit.transactions.take(5).toList()
                : cubit.searchOpening
                ? cubit.searchTransactions
                : cubit.filterOpening
                ? cubit.filterTransactions
                : cubit.transactions);
        return cubit.loadingTransactions
            ? _LoadingTransactionItems()
            : transactions.isEmpty
            ? _EmptyTransactionsItems(recentTransaction: recentTransaction)
            : _TransactionItems(
              recentTransaction: recentTransaction,
              transactions: transactions,
            );
      },
    );
  }
}

class _LoadingTransactionItems extends StatelessWidget {
  const _LoadingTransactionItems();

  @override
  Widget build(BuildContext context) {
    return CustomSkeletonizer(
      enable: true,
      child: _TransactionItems(
        recentTransaction: false,
        transactions: List.generate(5, (index) => loadingTransactionModel),
      ),
    );
  }
}

class _EmptyTransactionsItems extends StatelessWidget {
  final bool recentTransaction;
  const _EmptyTransactionsItems({required this.recentTransaction});

  @override
  Widget build(BuildContext context) {
    return Empty(state: recentTransaction ? EState.home : EState.list);
  }
}

class _TransactionItems extends StatelessWidget {
  final bool recentTransaction;
  final List<TransactionModel> transactions;
  const _TransactionItems({
    required this.transactions,
    required this.recentTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: recentTransaction ? EdgeInsets.zero : EdgeInsets.all(12.r),
      physics:
          recentTransaction
              ? NeverScrollableScrollPhysics()
              : AlwaysScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder:
          (context, index) =>
              _TransactionItem(transaction: transactions[index]),
      separatorBuilder: (context, index) => SizedBox(height: 8.h),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final TransactionModel transaction;
  const _TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return Dismissible(
      key: Key(transaction.id),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) async {
        DialogServices.showDeleteDialog(
          context: context,
          onTap: () => cubit.deleteTransaction(transaction),
        );
        return false;
      },
      background: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(Icons.delete, color: Colors.white, size: 30.r),
      ),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(12.r),
        child: _ItemBody(transaction: transaction),
      ),
    );
  }
}

class _ItemBody extends StatelessWidget {
  final TransactionModel transaction;
  const _ItemBody({required this.transaction});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    var langI = cubit.data.preferences.langI;
    return ListTile(
      onTap: () {
        cubit.setEditViewData(context: context, transaction: transaction);
      },
      tileColor: Theme.of(context).scaffoldBackgroundColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
      visualDensity: VisualDensity(vertical: -1.5, horizontal: -4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      leading: CustomIcon(
        color: transaction.category.color,
        icon: transaction.category.icon.toIconData(),
      ),
      title: CustomText(
        isHead: true,
        title: transaction.category.title[langI],
        fontSize: 20,
      ),
      subtitle: CustomText(
        isHead: false,
        title:
            transaction.notes == ''
                ? transaction.category.title[langI]
                : transaction.notes,
        fontSize: 16,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          cubit.setTransactionCardValue(
            type: transaction.type,
            value: transaction.value,
          ),

          cubit.setTransactionCardTime(
            s: S.of(context),
            time: transaction.time,
          ),
        ],
      ),
    );
  }
}
