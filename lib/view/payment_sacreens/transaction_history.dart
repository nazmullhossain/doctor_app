import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  TransactionHistoryScreenState createState() => TransactionHistoryScreenState();
}

class TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String selectedDate = 'June 6, 2020';

  final List<Transaction> transactions = [
    Transaction(
      title: 'Payment received',
      amount: 45.99,
      date: 'June 6, 2020',
      iconData: Icons.wallet,
    ),
    Transaction(
      title: 'Payment transfer',
      amount: 45.99,
      date: 'June 6, 2020',
      iconData: Icons.wallet_rounded,
    ),
    Transaction(
      title: 'Payment received',
      amount: 45.99,
      date: 'September 8, 2020',
      iconData: Icons.wallet,
    ),
    Transaction(
      title: 'Payment transfer',
      amount: 45.99,
      date: 'September 8, 2020',
      iconData: Icons.wallet_rounded,
    ),
    Transaction(
      title: 'Payment received',
      amount: 45.99,
      date: 'July 8, 2020',
      iconData: Icons.wallet,
    ),
    Transaction(
      title: 'Payment transfer',
      amount: 6.00,
      date: 'July 8, 2020',
      iconData: Icons.wallet_rounded,
    ),
    Transaction(
      title: 'Bonus received',
      amount: 5.99,
      date: 'August 7, 2020',
      iconData: Icons.wallet,
    ),
    Transaction(
      title: 'Balance transfer',
      amount: 9.99,
      date: 'August 7, 2020',
      iconData: Icons.wallet_rounded,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Transaction History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),

              child: DropdownButton<String>(
                underline: Container(),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down_rounded, size: 50),
                elevation: 0,
                value: selectedDate,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDate = newValue!;
                  });
                },
                items: <String>[
                  'June 6, 2020',
                  'August 7, 2020',
                  'September 8, 2020',
                  'July 8, 2020',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12,),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (ctx, index) {
                    final transaction = transactions[index];
                    if (transaction.date != selectedDate) {
                      return Container(); // Skip rendering for other dates
                    }
                    return
                      ListTile(
                        leading: Icon(transaction.iconData),
                        title: Text(transaction.title),
                        subtitle: Text(transaction.date),
                        trailing: Text(
                          '\$${transaction.amount.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Transaction {
  final String title;
  final double amount;
  final String date;
  final IconData iconData;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.iconData,
  });
}
