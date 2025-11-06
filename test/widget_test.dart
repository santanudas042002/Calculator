import 'package:firstdemo/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Hello world Test', (tester) async {
    await tester.pumpWidget(const MyApp());
  });
}
