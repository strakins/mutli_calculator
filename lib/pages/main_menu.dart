import 'package:calculator/components/appbar.dart';
import 'package:calculator/pages/loancalculatorpage.dart';
import 'package:calculator/pages/mutualfundspage.dart';
import 'package:calculator/pages/ppfcalculatorpage.dart';
import 'package:calculator/pages/sipcaculatorpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenu extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Loan Calculator', 'icon': Icons.account_balance, 'page': LoanCalculatorPage()},
    {'title': 'PPF Calculator', 'icon': Icons.pie_chart, 'page': PPFCalculatorPage()},
    {'title': 'SIP Calculator', 'icon': Icons.monetization_on, 'page': SIPCalculatorPage()},
    {'title': 'SWP Calculator', 'icon': Icons.savings, 'page': PPFCalculatorPage()},
    {'title': 'FD Calculator', 'icon': Icons.show_chart, 'page': MutualFundsCalculatorPage()},
    {'title': 'EMI Calculator', 'icon': Icons.insert_chart, 'page': PPFCalculatorPage()},
    {'title': 'EFP Calculator', 'icon': Icons.attach_money, 'page': PPFCalculatorPage()},
    {'title': 'Income Tax Calculator', 'icon': Icons.money_off, 'page': PPFCalculatorPage()},
    {'title': 'GST Calculator', 'icon': Icons.bar_chart, 'page': PPFCalculatorPage()},
    {'title': 'Mutual Calculator', 'icon': Icons.trending_up, 'page': PPFCalculatorPage()},
    {'title': 'RD Calculator', 'icon': Icons.insights, 'page': PPFCalculatorPage()},
    {'title': 'Sukanya Samriddhi Yojana', 'icon': Icons.analytics, 'page': PPFCalculatorPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeroBar(
        title: "Strakins",
        // pagedescroption: "Your Friendly Calculator",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            return _buildCard(
              menuItems[index]['title'],
              menuItems[index]['icon'],
              menuItems[index]['page'],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Get.to(page),
      child: Card(
        color: Color(0xFFEAF4F4),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50.0),
              SizedBox(height: 10.0),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:calculator/pages/loancalculatorpage.dart';
// import 'package:calculator/pages/mutualfundspage.dart';
// import 'package:calculator/pages/ppfcalculatorpage.dart';
// import 'package:calculator/pages/sipcaculatorpage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MainMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Polpular Calculator')),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: [
//           _buildCard('SIP Calculator', LoanCalculatorPage()),
//           _buildCard('Loan Calculator', LoanCalculatorPage()),
//           _buildCard('SWP Calculator', LoanCalculatorPage()),
//           _buildCard('FD Calculator', PPFCalculatorPage()),
//           _buildCard('RD Calculator', MutualFundsCalculatorPage()),
//           _buildCard('EMI Calculator', MutualFundsCalculatorPage()),
//           _buildCard('EPF Calculator', MutualFundsCalculatorPage()),
//           _buildCard('Income Tax Calculator', MutualFundsCalculatorPage()),
//           _buildCard('PPF Calculator', MutualFundsCalculatorPage()),
//           _buildCard('GST Calculator', MutualFundsCalculatorPage()),
//           _buildCard('Mutual Calculator', SIPCalculatorPage()),
//           _buildCard('Sukanya Samrdiri Yojana Calculator', MutualFundsCalculatorPage()),
//         ],
//       ),
//     );
//   }

//   Widget _buildCard(String title, Widget page) {
//     return GestureDetector(
//       onTap: () => Get.to(page),
//       child: Card(
//         child: Center(
//           child: Text(title),
//         ),
//       ),
//     );
//   }
// }
