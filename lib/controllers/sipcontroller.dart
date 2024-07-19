import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class SIPCalculatorController extends GetxController {
  var investmentAmount = 0.0.obs;
  var interestRate = 1.0.obs;
  var investmentTenure = 3.0.obs;

  var maturityAmount = 0.0.obs;
  var totalInvested = 0.0.obs;
  var totalGain = 0.0.obs;

  final NumberFormat currencyFormat = NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 2);

  @override
  void onInit() {
    super.onInit();
    investmentAmount.listen((_) => calculateResults());
    interestRate.listen((_) => calculateResults());
    investmentTenure.listen((_) => calculateResults());
  }

  void setInvestmentAmount(double value) {
    investmentAmount.value = value;
  }

  void setInterestRate(double value) {
    interestRate.value = value;
  }

  void setInvestmentTenure(double value) {
    investmentTenure.value = value;
  }

  void calculateResults() {
    double r = interestRate.value / 12 / 100;
    double n = investmentTenure.value * 12;
    double p = investmentAmount.value;

    double maturity = p * ((pow((1 + r), n) - 1) / r) * (1 + r);
    double totalInvestedAmount = p * n;
    double totalGainAmount = maturity - totalInvestedAmount;

    maturityAmount.value = maturity;
    totalInvested.value = totalInvestedAmount;
    totalGain.value = totalGainAmount;
  }

  String getFormattedValue(double value) {
    return currencyFormat.format(value);
  }
}
