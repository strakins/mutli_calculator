
import 'package:get/get.dart';

class PensionCalculatorController extends GetxController {
  var currentSalary = 0.0.obs;
  var yearsToRetirement = 0.0.obs;
  var previousContribution = 0.0.obs;
  var totalPension = 0.0.obs;
  var previouslyEmployed = false.obs;

  void setCurrentSalary(double value) {
    currentSalary.value = value;
  }

  void setYearsToRetirement(double value) {
    yearsToRetirement.value = value;
  }

  void setPreviousContribution(double value) {
    previousContribution.value = value;
  }

  void calculatePension() {
    double salary = currentSalary.value;
    double remittancePercentage = 0.15;
    double years = yearsToRetirement.value;

    double monthlyPensionContribution = salary * remittancePercentage;
    double totalMonths = years * 12;
    double totalContribution = monthlyPensionContribution * totalMonths + (previouslyEmployed.value ? previousContribution.value : 0);

    totalPension.value = totalContribution;
  }
}