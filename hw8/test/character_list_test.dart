import 'package:cs311hw08/character_detail.dart';
import 'package:cs311hw08/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Test ListView',
  (tester) async {
    final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
    .thenAnswer((_) async => Future.delayed(
    const Duration(seconds: 1),() => http.Response(
      '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',200)));
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: CharacterList(client: client),)));
    await tester.pumpAndSettle();
    final listFinder = find.byType(Scrollable);
    final findListView = find.byType(ListView);
    await tester.scrollUntilVisible(
      findListView,
      500.0,
      scrollable: listFinder,
    );
    expect(findListView, findsOneWidget);
});

  testWidgets('Test ListTile',
  (tester) async {
    final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
    .thenAnswer((_) async => Future.delayed(
    const Duration(seconds: 1),() => http.Response(
      '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',200)));
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: CharacterList(client: client),)));
    await tester.pumpAndSettle();
    final findListTile = find.byType(ListTile);
    expect(findListTile, findsWidgets);    
});

  testWidgets('Test Error',
  (tester) async {
    final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
    .thenAnswer((_) async => Future.delayed(
    const Duration(seconds: 1),() => http.Response('Not Found', 404)));
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: CharacterList(client: client),)));
    await tester.pumpAndSettle();
    final findError = find.byType(Text);
    expect(findError, findsOneWidget);    
});

    testWidgets('Test OnTap',
  (tester) async {
    final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
    .thenAnswer((_) async => Future.delayed(
    const Duration(seconds: 1),() => http.Response(
      '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]',200)));
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: CharacterList(client: client),)));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();
    final findCharacterDetail = find.byType(CharacterDetail);
    expect(findCharacterDetail, findsOneWidget);
});
}