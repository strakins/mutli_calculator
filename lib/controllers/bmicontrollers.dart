import 'package:get/get.dart';

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
