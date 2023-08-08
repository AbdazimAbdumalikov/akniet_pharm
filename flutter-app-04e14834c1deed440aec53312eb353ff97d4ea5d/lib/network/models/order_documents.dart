class OrderDocuments {
  String? id;
  String? name;
  String? url;
  String? urlEgov;
  int? status;

  OrderDocuments({
    required this.id,
    required this.name,
    required this.url,
    required this.urlEgov,
    required this.status,
  });

  OrderDocuments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] == 'Medic' ? 'Мед осмотр' : 'ТТН';
    url = json['url'];
    urlEgov = json['url_egov'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['url_egov'] = urlEgov;
    data['status'] = status;
    return data;
  }
}
