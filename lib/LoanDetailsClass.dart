class LoanDetailsClass {
  final int LoanID;
  final int MemberID;
  final String Date;
  final int LoanAmount;
  final String LoanStatus;


  LoanDetailsClass({this.LoanID, this.MemberID, this.Date, this.LoanAmount,
      this.LoanStatus});

  factory LoanDetailsClass.fromJson(Map<String, dynamic> json) {
    return LoanDetailsClass(
        LoanID: json['LoanID'] as int,
        MemberID: json['MemberID'] as int,
        Date: json['Date'] as String,
        LoanAmount: json['LoanAmount'] as int,
        LoanStatus: json['LoanStatus'] as String);
  }
}
