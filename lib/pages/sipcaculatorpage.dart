import 'package:calculator/components/appbar.dart';
import 'package:calculator/controllers/sipcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SIPCalculatorPage extends StatelessWidget {
  final SIPCalculatorController controller = Get.put(SIPCalculatorController());

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
              "SIP Calculator",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF28ADAB)),
            ),
            SizedBox(height: 20),
            _buildInvestmentAmountRow(),
            _buildInvestmentAmountSlider(),
            _buildInterestRateRow(),
            _buildInterestRateSlider(),
            _buildInvestmentTenureRow(),
            _buildInvestmentTenureSlider(),
            Divider(height: 40, color: Colors.grey),
            _buildResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentAmountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Investment Amount', style: TextStyle(fontSize: 18)),
        Card(
          color: Color(0xFF28ADAB),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Text('\$${controller.getFormattedValue(controller.investmentAmount.value)}')),
          ),
        ),
      ],
    );
  }

  Widget _buildInvestmentAmountSlider() {
    return Obx(() => Slider(
          value: controller.investmentAmount.toDouble(),
          min: 0,
          max: 100000,
          divisions: 100000,
          activeColor: Color(0xFF28ADAB),
          inactiveColor: Color(0xFF28ADAB).withOpacity(0.3),
          label: controller.investmentAmount.toInt().toString(),
          onChanged: (value) {
            controller.setInvestmentAmount(value);
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
          max: 20.0,
          divisions: 190,
          activeColor: Color(0xFF28ADAB),
          inactiveColor: Color(0xFF28ADAB).withOpacity(0.3),
          label: controller.interestRate.toStringAsFixed(1),
          onChanged: (value) {
            controller.setInterestRate(value);
          },
        ));
  }

  Widget _buildInvestmentTenureRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Investment Tenure (years)', style: TextStyle(fontSize: 18)),
        Card(
          color: Color(0xFF28ADAB),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Text('${controller.investmentTenure.toInt()} years')),
          ),
        ),
      ],
    );
  }

  Widget _buildInvestmentTenureSlider() {
    return Obx(() => Slider(
          value: controller.investmentTenure.toDouble(),
          min: 1,
          max: 30,
          divisions: 29,
          activeColor: Color(0xFF28ADAB),
          inactiveColor: Color(0xFF28ADAB).withOpacity(0.3),
          label: '${controller.investmentTenure.toInt()} years',
          onChanged: (value) {
            controller.setInvestmentTenure(value);
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
            const Text(
              'Maturity Amount:',
               style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Obx(() => Text(
              '\#${controller.getFormattedValue(controller.maturityAmount.value)}',
               style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Invested Amount:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Obx(() => Text('\#${controller.getFormattedValue(controller.totalInvested.value)}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Gain:',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Obx(() => Text('\#${controller.getFormattedValue(controller.totalGain.value)}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )),
          ],
        ),
      ],
    );
  }
}
