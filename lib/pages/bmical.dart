import 'package:calculator/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BMICalculatorPage extends StatelessWidget {
  final BMICalculatorController controller = Get.put(BMICalculatorController());

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
              "BMI Calculator",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF28ADAB)),
            ),
            SizedBox(height: 20),
            _buildHeightInput(context),
            SizedBox(height: 20),
            _buildWeightInput(context),
            SizedBox(height: 20),
            _buildCalculateButton(),
            Divider(height: 40, color: Colors.grey),
            _buildResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeightInput(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Height (cm)', style: TextStyle(fontSize: 18)),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              controller.setHeight(double.tryParse(value.replaceAll(',', '')) ?? 0);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Height',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeightInput(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Weight (kg)', style: TextStyle(fontSize: 18)),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              controller.setWeight(double.tryParse(value.replaceAll(',', '')) ?? 0);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Weight',
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
          controller.calculateBMI();
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
        Text('Your BMI:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF28ADAB))),
        SizedBox(height: 10),
        Obx(() {
          final formattedBMI = NumberFormat('##.##').format(controller.bmi.value);
          return Text('$formattedBMI kg/m²', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500));
        }),
      ],
    );
  }
}

class BMICalculatorController extends GetxController {
  var height = 0.0.obs;
  var weight = 0.0.obs;
  var bmi = 0.0.obs;

  void setHeight(double value) {
    height.value = value;
  }

  void setWeight(double value) {
    weight.value = value;
  }

  void calculateBMI() {
    if (height.value > 0 && weight.value > 0) {
      double heightInMeters = height.value / 100;
      bmi.value = weight.value / (heightInMeters * heightInMeters);
    } else {
      bmi.value = 0;
    }
  }
}
