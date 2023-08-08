class Repairs {
  int? id;
  int? purchaseId;
  String? transportMarkModel;
  String? transportNumber;
  String? category;
  String? responsible;
  String? name;
  String? character;
  DateTime? startDate;
  DateTime? endDate;
  bool? showDate;
  String? status;

  Repairs({
    this.id,
    this.purchaseId,
    this.transportMarkModel,
    this.transportNumber,
    this.category,
    this.responsible,
    this.name,
    this.character,
    this.startDate,
    this.endDate,
    this.showDate,
    this.status,
  });

  Repairs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseId = json['purchase_id'];
    transportMarkModel = json['transport_mark_model'];
    transportNumber = json['transport_number'];
    category = json['category'];
    responsible = json['responsible'];
    name = json['name'];
    character = json['character'];
    startDate = (json['start_date'] != null && json['start_date'] != '')
        ? DateTime.parse(json['start_date'])
        : null;
    endDate = (json['end_date'] != null && json['end_date'] != '')
        ? DateTime.parse(json['end_date'])
        : null;
    showDate = json['show_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['purchase_id'] = purchaseId;
    data['transport_mark_model'] = transportMarkModel;
    data['transport_number'] = transportNumber;
    data['category'] = category;
    data['responsible'] = responsible;
    data['name'] = name;
    data['character'] = character;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['show_date'] = showDate;
    data['status'] = status;
    return data;
  }
}
