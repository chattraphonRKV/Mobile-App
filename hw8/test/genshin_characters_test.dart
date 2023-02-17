import 'package:cs311hw08/genshin_characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'genshin_characters_test.mocks.dart';

@GenerateMocks([http.Client])
void main(){
  test('returns GenshinCharacters if the http call completes successfully',
    () async {
  final client = MockClient();
  when(client.get(Uri.parse('https://api.genshin.dev/characters')))
      .thenAnswer((_) async => http.Response(
          '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));
  expect(await fetchCharacters(client), isA<GenshinCharacters>());
});

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(fetchCharacters(client), throwsException);
});

  test('returns CharacterInfo if the http call completes successfully',
      () async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters/hu-tao')))
        .thenAnswer((_) async => http.Response(
          '{"name":"Hu Tao","vision":"Pyro","weapon":"Polearm","nation":"Liyue","description":"The 77th Director of the Wangsheng Funeral Parlor. She took over the business at a rather young age."}', 200));
  expect(await fetchCharacterInfo(client,'hu-tao'), isA<CharacterInfo>());
});

 test('throws an exception if the http call completes with an error', () {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(fetchCharacterInfo(client, 'albedo'), throwsException);
  });
}