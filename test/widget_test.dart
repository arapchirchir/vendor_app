import 'package:flutter_test/flutter_test.dart';
import 'package:sixam_mart_store/util/app_constants.dart';

void main() {
  test('uses Letsy Vendor branding and a valid HTTPS API origin', () {
    final baseUrl = Uri.parse(AppConstants.baseUrl);

    expect(AppConstants.appName, 'Letsy Vendor');
    expect(baseUrl.scheme, 'https');
    expect(baseUrl.host, isNotEmpty);
    expect(baseUrl.path, isEmpty);
  });
}
