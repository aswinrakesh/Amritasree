class DepositClass {
  final int TotalPaid;
  final int RemainingAmount ;
  final int PresentSavings ;
  final int RemainingLoanAmount ;
  final int Savings ;
  final int LoanPaid ;
  final int InterestPaid ;
  final int RemainingInterest ;
  final int Balance ;
  final int LastPayment ;
  final String DateofPayment;

  DepositClass({this.TotalPaid, this.RemainingAmount, this.PresentSavings,
      this.RemainingLoanAmount, this.Savings, this.LoanPaid, this.InterestPaid,
      this.RemainingInterest, this.Balance, this.LastPayment,
      this.DateofPayment});

  factory DepositClass.fromJson(Map<String, dynamic> json) {
    return DepositClass(
      TotalPaid: json['TotalPaid'] as int,
      RemainingAmount: json['RemainingAmount'] as int,
      PresentSavings: json['PresentSavings'] as int,
      RemainingLoanAmount: json['RemainingLoanAmount'] as int,
      Savings: json['Savings'] as int,
      LoanPaid: json['LoanPaid'] as int,
      InterestPaid: json['InterestPaid'] as int,
      RemainingInterest: json['RemainingInterest'] as int,
      Balance: json['Balance'] as int,
      LastPayment: json['LastPayment'] as int,
      DateofPayment: json['DateofPayment'] as String,
    );
  }
}
