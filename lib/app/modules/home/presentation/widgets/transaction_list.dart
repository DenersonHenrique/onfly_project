import 'package:flutter/material.dart';

import 'transaction_item.dart';
import '../../../../models/transaction.dart';
import '../../../../constants/app_string.dart';

class TransactionListWidget extends StatelessWidget {
  final void Function(String) onRemove;
  final List<TransactionModel> transactions;

  const TransactionListWidget(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) => transactions.isEmpty
      ? LayoutBuilder(builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.15,
                child: Text(
                  AppString.emptyTransaction,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                height: constraints.maxHeight * 0.6,
                child: const Icon(
                  Icons.list,
                  size: 150,
                ),
              ),
            ],
          );
        })
      : ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            final tr = transactions[index];
            return TransactionItemWidget(
              onRemove: onRemove,
              transactionModel: tr,
            );
          },
        );
}
