import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/app_string.dart';

class TransactionFormWidget extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionFormWidget(this.onSubmit, {super.key});

  @override
  State<TransactionFormWidget> createState() => _TransactionFormWidgetState();
}

class _TransactionFormWidgetState extends State<TransactionFormWidget> {
  DateTime? _selectedDate = DateTime.now();
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) return;
    widget.onSubmit(title, value, _selectedDate!);
  }

  @override
  Widget build(BuildContext context) => Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                onSubmitted: (_) => _submitForm(),
                controller: _titleController,
                decoration: InputDecoration(labelText: AppString.labelTitle),
              ),
              TextField(
                onSubmitted: (_) => _submitForm(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _valueController,
                decoration: InputDecoration(labelText: AppString.labelValue),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? AppString.emptyDate
                            : '${AppString.selectedDate} ${DateFormat('dd/MM/y').format(_selectedDate!)}',
                      ),
                    ),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        AppString.selectDate,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(AppString.newTransaction),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
