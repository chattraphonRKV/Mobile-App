import 'package:cs311hw08/character_detail.dart';
import 'package:cs311hw08/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){
  testWidgets('CharacterList should display a detail of character',
(tester) async {
  final client = MockClient();
  when(client.get(Uri.parse('https://api.genshin.dev/characters/hu-tao')))
      .thenAnswer((_) async => Future.delayed(
          const Duration(seconds: 1),   
          () => http.Response(
              '{"name":"Hu Tao","vision":"Pyro","weapon":"Polearm","nation":"Liyue","description":"The 77th Director of the Wangsheng Funeral Parlor. She took over the business at a rather young age."}',200)));
  await tester.pumpWidget(MaterialApp(home: CharacterDetail(client: client, name: 'hu-tao',)));
  await tester.pumpAndSettle();
  final findDetail = find.byType(Column);
  expect(findDetail, findsOneWidget);
});

testWidgets('Test Error',
  (tester) async {
    final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters/raiden')))
    .thenAnswer((_) async => Future.delayed(
    const Duration(seconds: 1),() => http.Response('Not Found', 404)));
    await tester.pumpWidget(MaterialApp(home: CharacterDetail(client: client, name: 'raiden',)));
    await tester.pumpAndSettle();
    final findError = find.byType(Text);
    expect(findError, findsWidgets);
});
}