import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sixam_mart_store/helper/notification_helper.dart';
import 'package:sixam_mart_store/features/notification/domain/models/notification_body_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('dexterous.com/flutter/local_notifications');
  final calls = <MethodCall>[];
  setUp(() async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    calls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async { calls.add(call); return true; });
    await FlutterLocalNotificationsPlugin().initialize(const InitializationSettings(android: AndroidInitializationSettings('notification_icon')));
  });
  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });
  test('data-only order gets a standard alert with a routable payload even without display text', () async {
    await NotificationHelper.showNotification(
      const RemoteMessage(data: {'type': 'new_order', 'order_id': '42'}),
      FlutterLocalNotificationsPlugin(),
    );
    final args = calls.singleWhere((c) => c.method == 'show').arguments as Map;
    expect(args['body'], 'Open app and check order details.');
    final payload = NotificationBodyModel.fromJson(jsonDecode(args['payload'] as String));
    expect(payload.notificationType, NotificationType.order);
    expect(payload.orderId, 42);
    expect(args['platformSpecifics']['channelId'], '6ammart');
    expect(args['platformSpecifics']['playSound'], true);
  });
  test('notification display text falls back to the FCM notification fields', () async {
    await NotificationHelper.showNotification(
      const RemoteMessage(data: {'type': 'new_order', 'order_id': '43'},
        notification: RemoteNotification(title: 'Order received', body: 'Review order 43')),
      FlutterLocalNotificationsPlugin(),
    );
    final args = calls.singleWhere((c) => c.method == 'show').arguments as Map;
    expect(args['title'], 'Order received');
    expect(args['body'], 'Review order 43');
  });
}
