import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../models/transaction.dart';

class TransactionItemWidget extends StatefulWidget {
  final void Function(String) onRemove;
  final TransactionModel transactionModel;

  const TransactionItemWidget({
    super.key,
    required this.onRemove,
    required this.transactionModel,
  });

  @override
  State<TransactionItemWidget> createState() => _TransactionItemWidgetState();
}

class _TransactionItemWidgetState extends State<TransactionItemWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ExpansionTile(
        leading: CircleAvatar(
          radius: 40,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FittedBox(
              child: Text(
                  'R\$${widget.transactionModel.value.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          widget.transactionModel.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('dd/MM/y').format(widget.transactionModel.date),
        ),
        trailing: Icon(
          _customTileExpanded
              ? Icons.arrow_drop_down_circle
              : Icons.arrow_drop_down,
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    size: 24.0,
                  ),
                  label: const Text('Editar'), // <-- Text
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 24.0,
                  ),
                  label: const Text('Apagar'), // <-- Text
                ),
              ],
            ),
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customTileExpanded = expanded;
          });
        },
      ),
    );
  }
}
