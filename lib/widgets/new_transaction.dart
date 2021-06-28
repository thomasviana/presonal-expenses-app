import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0) {
      return;
    }
    widget.addNewTx(
      titleController.text,
      double.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  keyboardType: TextInputType.text,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => submitData(),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: submitData,
                  child: Text(
                    'Add Transaction',
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
