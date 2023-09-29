import 'package:flutter/material.dart';

import 'transaction_item.dart';
import '../models/transaction.dart';
import '../constants/app_string.dart';

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
            // Card(
            //   elevation: 5,
            //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            //   child:
            //   ListTile(
            //     leading: CircleAvatar(
            //       radius: 40,
            //       child: Padding(
            //         padding: const EdgeInsets.all(15.0),
            //         child: FittedBox(
            //           child: Text('R\$${tr.value.toStringAsFixed(2)}'),
            //         ),
            //       ),
            //     ),
            //     title: Text(
            //       tr.title,
            //       style: Theme.of(context).textTheme.titleLarge,
            //     ),
            //     subtitle: Text(
            //       DateFormat('d MMM y').format(tr.date),
            //     ),
            //     trailing: MediaQuery.of(context).size.width > 480
            //         ? TextButton.icon(
            //             onPressed: () => onRemove(tr.id),
            //             icon: const Icon(Icons.delete),
            //             label: Text(AppString.labelDelete),
            //           )
            //         : IconButton(
            //             icon: const Icon(Icons.delete),
            //             color: Theme.of(context).colorScheme.error,
            //             onPressed: () => onRemove(tr.id),
            //           ),
            //   ),
            // );
          },
        );
}
