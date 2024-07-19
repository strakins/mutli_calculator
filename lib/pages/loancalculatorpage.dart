import 'package:calculator/components/appbar.dart';
import 'package:calculator/controllers/loan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoanCalculatorPage extends StatelessWidget {
  final LoanCalculatorController controller = Get.put(LoanCalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeroBar(title: 'Strakins'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Loan Calculator",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF28ADAB)),
            ),
            SizedBox(height: 20),
            _buildLoanAmountRow(),
            _buildLoanAmountSlider(),
            _buildInterestRateRow(),
            _buildInterestRateSlider(),
            _buildLoanTenureRow(),
            _buildLoanTenureSlider(),
            Divider(height: 40, color: Colors.grey),
            _buildResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanAmountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Loan Amount', style: TextStyle(fontSize: 18)),
        Card(
          color: Color(0xFF28ADAB),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Text('\#${controller.getFormattedValue(controller.loanAmount.value)}')),
          ),
        ),
      ],
    );
  }

  Widget _buildLoanAmountSlider() {
    return Obx(() => Slider(
          value: controller.loanAmount.toDouble(),
          min: 0,
          max: 100000,
          divisions: 100000,
          activeColor: Color(0xFF28ADAB),
          inactiveColor: Color(0xFF28ADAB).withOpacity(0.3),
          label: controller.loanAmount.toInt().toString(),
          onChanged: (value) {
            controller.setLoanAmount(value);
          },
        ));
  }

  Widget _buildInterestRateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Interest Rate (p.a)', style: TextStyle(fontSize: 18)),
        Card(
          color: Color(0xFF28ADAB),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Text('${controller.interestRate.toStringAsFixed(1)}%')),
          ),
        ),
      ],
    );
  }

  Widget _buildInterestRateSlider() {
    return Obx(() => Slider(
          value: controller.interestRate.toDouble(),
          min: 1.0,
          max: 10.0,
          divisions: 18,
          activeColor: Color(0xFF28ADAB),
          inactiveColor: Color(0xFF28ADAB).withOpacity(0.3),
          label: controller.interestRate.toStringAsFixed(1),
          onChanged: (value) {
            controller.setInterestRate(value);
          },
        ));
  }

  Widget _buildLoanTenureRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Loan Tenure', style: TextStyle(fontSize: 18)),
        Card(
          color: Color(0xFF28ADAB),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Text('${controller.loanTenure.toInt()} months')),
          ),
        ),
      ],
    );
  }

  Widget _buildLoanTenureSlider() {
    return Obx(() => Slider(
          value: controller.loanTenure.toDouble(),
          min: 3,
          max: 60,
          divisions: 57,
          activeColor: Color(0xFF28ADAB),
          inactiveColor: Color(0xFF28ADAB).withOpacity(0.3),
          label: '${controller.loanTenure.toInt()} months',
          onChanged: (value) {
            controller.setLoanTenure(value);
          },
        ));
  }

  Widget _buildResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Results:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Monthly EMI:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Obx(() => Text('\#${controller.getFormattedValue(controller.monthlyEMI.value)}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Interest:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Obx(() => Text('\#${controller.getFormattedValue(controller.totalInterest.value)}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount Payable:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Obx(() => Text('\#${controller.getFormattedValue(controller.totalAmount.value)}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Principal Amount:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Obx(() => Text('\#${controller.getFormattedValue(controller.loanAmount.value)}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )),
          ],
        ),
      ],
    );
  }
}
