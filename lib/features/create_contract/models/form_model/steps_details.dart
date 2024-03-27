class StepsDetails {
  String stepTitle;
  DateTime? date;
  bool isDone;
  String? manddobName;
  List<String>? notes;

  StepsDetails({
    required this.stepTitle,
    this.date,
    required this.isDone,
    this.notes,
      this.manddobName
  });

  // Convert StepsDetails object to a Map
  Map<String, dynamic> toMap() {
    return {
      'stepTitle': stepTitle,
      'date': date, // Convert DateTime to milliseconds
      'isDone': isDone,
      'notes': notes,
      'manddobName': manddobName,
    };
  }

  static List<StepsDetails> initList(List<String> stepTitles) {
    List<StepsDetails> steps = [];
    stepTitles.forEach((element) {
      steps.add(StepsDetails.init(element));
    });
    return steps;
  }

  static StepsDetails init(String stepTitles) {
    return StepsDetails(
      stepTitle: stepTitles,
      date: null,
      isDone: false,
      notes: null,
      manddobName: '',
    );
  }

  // Create StepsDetails object from a Map
  static StepsDetails fromMap(Map<String, dynamic> map) {
    return StepsDetails(
      stepTitle: map['stepTitle'],
      date: map['date'] != null ? map['date'].toDate() : null,
      isDone: map['isDone'] ?? false,
      notes: map['notes'] != null ? List<String>.from(map['notes']) : null,
      manddobName: map['manddobName'],
    );
  }
}
