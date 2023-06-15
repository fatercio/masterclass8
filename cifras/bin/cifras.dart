import 'dart:io';
import 'dart:math';

//Número de letras do alfabeto
var numLetters = 26;
//Posição inicial da tabela ASCII maíscula A
var initAscPos = 65;
//Posição final da tabela ASCII maíscula.
var endAscPos = 91;

void main(List<String> arguments) {
  var key;
  var option = 1;

  String text = "O MAIOR CANAL DE FLUTER TER DO BRASIL";

  //Para executar o encode e decode é necessário ter uma chave que tenha valores randômicos mas que tenha a mesma quantidade de caracteres do texto a ser criptografado.
  key = generateKey(lenth: text.length);
  print('KEY: $key');

  print('TEXT: $text');
  //Receba a o texto a ser criptografado e a chave em questão.
  var resp = encode(text: text, key: key);

  do {
    stdout.write("\n-----------------------------------------------");
    stdout.write("\nOpção 1: ENCODE ");
    stdout.write("\nOpção 2: DECODE: ");
    stdout.write("\nOpção 0: SAIR:");
    stdout.write("\n\n\nOPÇÃO:");

    option = (int.parse(stdin.readLineSync()!));
    switch (option) {
      case 1:
        var key;
        stdout.write("\nInforme o TEXTO: ");
        text = (stdin.readLineSync())!;
        key = generateKey(lenth: text.length);
        print("KEY:  X-" + key + "-X");
        print("ENCODE: X-" + encode(text: text, key: key) + "-X");
        break;
      case 2:
        var key;
        stdout.write("\nInforme o texto CIFRADO: ");
        text = (stdin.readLineSync())!;
        stdout.write("\nInforme a KEY: ");
        key = (stdin.readLineSync())!;
        print("DECODE: " + decode(textEncode: text, key: key));
        break;
      default:
    }
    stdout.write("\n------------------------------------------");
  } while (option != 0);
}

//Receba o texto a ser criptografado e a chave de criptografia.
String encode({required String text, required String key}) {
  List<String> encode = <String>[];

  for (var i = 0; i < text.length; i++) {
    if (isalphabet(text[i])) {
      var posText = text.codeUnitAt(i);
      var posKey = key.codeUnitAt(i);
      var sumPos = ((posKey + posText) % numLetters) + 'A'.codeUnits[0];
      // print('posKey: $posKey');
      // print('posText: $posText');
      // print('sum: $sumPos');
      encode.add(String.fromCharCode(sumPos));
    } else {
      encode.add(text[i]);
    }
  }

  return encode.join();
}

//Receba o texto a ser criptografado e a chave de criptografia.
String encodeRecusivo({required String text, required String key}) {
  List<String> encode = <String>[];

  for (var i = 0; i < text.length; i++) {
    if (isalphabet(text[i])) {
      var posText = text.codeUnitAt(i);
      var posKey = key.codeUnitAt(i);
      var sumPos = ((posKey + posText) % numLetters) + 'A'.codeUnits[0];
      // print('posKey: $posKey');
      // print('posText: $posText');
      // print('sum: $sumPos');
      encode.add(String.fromCharCode(sumPos));
    } else {
      encode.add(text[i]);
    }
  }

  return encode.join();
}

//Receba a o texto criptografado e a chave.
//Executar a decriptografica do texto que foi encodado com a Key
String decode({required String textEncode, required String key}) {
  List<String> decode = <String>[];

  for (var i = 0; i < textEncode.length; i++) {
    if (isalphabet(textEncode[i])) {
      var posText = textEncode.codeUnitAt(i);
      var posKey = key.codeUnitAt(i);
      var sumPos = 0;

      sumPos =
          (((posText - posKey) + numLetters) % numLetters) + 'A'.codeUnits[0];
      // print('posKey: $posKey');
      // print('posText: $posText');
      // print('sum: $sumPos');
      decode.add(String.fromCharCode(sumPos));
    } else {
      decode.add(textEncode[i]);
    }
  }

  return decode.join();
}

// Verifica se o char faz parte do alfabeto maísculo
bool isalphabet(String char) {
  var isAlpha = false;
  if (char.codeUnits[0] >= initAscPos && char.codeUnits[0] < endAscPos) {
    isAlpha = true;
  }

  return isAlpha;
}

//Geração da key randomica
String generateKey({required lenth}) {
  var random = Random();

  var t = List.generate(
      lenth,
      (index) => (String.fromCharCode(
          initAscPos + random.nextInt(/*endAscPos - initAscPos*/ 128))));

  return t.join();
}
