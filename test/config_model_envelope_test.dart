import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sixam_mart_store/api/api_client.dart';
import 'package:sixam_mart_store/common/models/config_model.dart';

void main() {
  test('unwraps identical_code envelope and parses ConfigModel without crash', () {
    const rawEnvelope = '''
    {
      "identical_code": "default_200",
      "message": "Successfully fetched",
      "content": {
        "business_name": "Letsy",
        "maintenance_mode": false,
        "app_minimum_version_android_store": 4,
        "app_minimum_version_ios_store": 0,
        "currency_symbol": "Ksh",
        "default_location": {"lat": "-0.06", "lng": "37.66"}
      },
      "errors": []
    }
    ''';

    final decoded = jsonDecode(rawEnvelope);
    final unwrapped = ApiClient.unwrapEnvelope(decoded, 200);

    expect(unwrapped, isA<Map<String, dynamic>>());
    expect(unwrapped['business_name'], 'Letsy');

    final config = ConfigModel.fromJson(unwrapped as Map<String, dynamic>);
    expect(config.businessName, 'Letsy');
    expect(config.maintenanceMode, isFalse);
    expect(config.appMinimumVersionAndroid, 4.0);
  });

  test('ConfigModel.fromJson directly handles envelope if passed raw', () {
    const rawEnvelope = '''
    {
      "identical_code": "default_200",
      "message": "Successfully fetched",
      "content": {
        "business_name": "Letsy",
        "maintenance_mode": false
      }
    }
    ''';

    final config = ConfigModel.fromJson(jsonDecode(rawEnvelope));
    expect(config.businessName, 'Letsy');
    expect(config.maintenanceMode, isFalse);
  });
}
