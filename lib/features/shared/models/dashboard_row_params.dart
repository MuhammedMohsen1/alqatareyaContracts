class DashboardRowParams {
  String contractNum;
  ContractStatus Status;
  DateTime? createdDate;
  String note;
  DashboardRowParams(
      this.contractNum, this.Status, this.createdDate, this.note);
}

enum ContractStatus { NOTSTARTED, STARTED, FINISHED }
