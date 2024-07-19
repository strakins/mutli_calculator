import 'package:get/get.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class LoanCalculatorController extends GetxController {
  var loanAmount = 0.0.obs;
  var interestRate = 1.0.obs;
  var loanTenure = 3.0.obs;

  var monthlyEMI = 0.0.obs;
  var totalInterest = 0.0.obs;
  var totalAmount = 0.0.obs;

  final NumberFormat currencyFormat = NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 2);

  @override
  void onInit() {
    super.onInit();
    loanAmount.listen((_) => calculateResults());
    interestRate.listen((_) => calculateResults());
    loanTenure.listen((_) => calculateResults());
  }

  void setLoanAmount(double value) {
    loanAmount.value = value;
  }

  void setInterestRate(double value) {
    interestRate.value = value;
  }

  void setLoanTenure(double value) {
    loanTenure.value = value;
  }

  void calculateResults() {
    double r = interestRate.value / 12 / 100;
    double n = loanTenure.value;
    double p = loanAmount.value;

    double emi = (p * r * pow((1 + r), n)) / (pow((1 + r), n) - 1);
    double totalPayable = emi * n;
    double totalInt = totalPayable - p;

    monthlyEMI.value = emi;
    totalInterest.value = totalInt;
    totalAmount.value = totalPayable;
  }

  String getFormattedValue(double value) {
    return currencyFormat.format(value);
  }
}
