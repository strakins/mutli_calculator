import 'package:calculator/components/appbar.dart';
import 'package:calculator/controllers/ppfcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PPFCalculatorPage extends StatelessWidget {
  final PensionCalculatorController controller = Get.put(PensionCalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeroBar(title: 'Strakins'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pension Fund Calculator",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF28ADAB)),
            ),
            SizedBox(height: 20),
            _buildSalaryInput(context),
            SizedBox(height: 20),
            _buildYearsToRetirementInput(context),
            SizedBox(height: 20),
            _buildPreviouslyEmployedCheckbox(),
            Obx(() {
              return controller.previouslyEmployed.value
                  ? Column(
                      children: [
                        SizedBox(height: 20),
                        _buildPreviousContributionInput(context),
                      ],
                    )
                  : Container();
            }),
            SizedBox(height: 20),
            _buildCalculateButton(),
            Divider(height: 40, color: Colors.grey),
            _buildResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildSalaryInput(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Current Salary', style: TextStyle(fontSize: 18)),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              controller.setCurrentSalary(double.tryParse(value.replaceAll(',', '')) ?? 0);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Salary',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildYearsToRetirementInput(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Years to Retirement', style: TextStyle(fontSize: 18)),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              controller.setYearsToRetirement(double.tryParse(value.replaceAll(',', '')) ?? 0);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Years',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreviouslyEmployedCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Previously Employed?', style: TextStyle(fontSize: 18)),
        Obx(() {
          return Checkbox(
            value: controller.previouslyEmployed.value,
            onChanged: (value) {
              controller.previouslyEmployed.value = value ?? false;
            },
            activeColor: Color(0xFF28ADAB),
          );
        }),
      ],
    );
  }

  Widget _buildPreviousContributionInput(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Previous Contribution', style: TextStyle(fontSize: 18)),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              controller.setPreviousContribution(double.tryParse(value.replaceAll(',', '')) ?? 0);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Amount',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalculateButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.calculatePension();
        },
        child: Text('Calculate'),
        style: ElevatedButton.styleFrom(
          // primary: Color(0xFF28ADAB),
        ),
      ),
    );
  }

  Widget _buildResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Estimated Pension:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF28ADAB))),
        SizedBox(height: 10),
        Obx(() {
          final formattedPension = NumberFormat.currency(locale: 'en_US', symbol: '\$').format(controller.totalPension.value);
          return Text(formattedPension, style: TextStyle(fontSize: 18));
        }),
      ],
    );
  }
}

