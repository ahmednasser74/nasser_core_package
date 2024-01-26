import 'package:nasser_core_package/nasser_core_package.dart';

class DropDownExampleResponseModel extends BaseResponse<DropDownExampleResponseModel> {
  final int shipmentId;
  final int orderId;
  final String fileUrl;

  DropDownExampleResponseModel({
    required this.shipmentId,
    required this.orderId,
    required this.fileUrl,
  });

  factory DropDownExampleResponseModel.fromJson(Map<String, dynamic> json) {
    return DropDownExampleResponseModel(
      shipmentId: json['shipmentId'],
      orderId: json['orderId'],
      fileUrl: json['fileUrl'],
    );
  }

  @override
  DropDownExampleResponseModel fromJson(Map<String, dynamic> json) {
    return DropDownExampleResponseModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'shipmentId': shipmentId,
      'orderId': orderId,
      'fileUrl': fileUrl,
    };
  }

  @override
  List<Object?> get props => [shipmentId, orderId, fileUrl];
}

class LoginResponseModel extends AppDropdownBaseModel<LoginResponseModel> {
  // final String? token;

  LoginResponseModel({this.id, this.item, this.total});
  late final int? id;
  late final String? item;
  late final dynamic total;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json['id'],
      item: json['item'],
      total: json['total'],
    );
  }

  @override
  fromJson(Map<String, dynamic> json) => LoginResponseModel.fromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['item'] = item;
    data['total'] = total;
    data['code'] = 200;
    data['status'] = true;
    data['errors'] = ['errors'];
    return data;
  }

  @override
  List<Object?> get props => [id, item, total];

  @override
  String get textDisplay => item ?? '';
}

class LoginRequest with Request, GetRequest {
  const LoginRequest(this.requestModel);

  @override
  final LoginRequestModel requestModel;

  @override
  String get path => "finance/invoices";
}

class LoginRequestModel extends RequestModel {
  final String email;
  final String password;

  LoginRequestModel({
    required this.email,
    required this.password,
    RequestProgressListener? progressListener,
  }) : super(progressListener);

  @override
  Future<Map<String, dynamic>> toJson() async => {};

  @override
  List<Object?> get props => [email, password];
}
