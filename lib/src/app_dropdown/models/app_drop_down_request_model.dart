import 'package:nasser_core_package/src/core/network/index.dart';

class AppDropDownRequestModel extends RequestModel {
  AppDropDownRequestModel({
    this.page = 0,
    this.search,
    RequestProgressListener? progressListener,
  }) : super(progressListener);

  final int page;
  final String? search;

  @override
  List<Object?> get props => [page, search];

  @override
  Future toJson() async => <String, dynamic>{
        'page': page,
        'search': search,
      };
}
