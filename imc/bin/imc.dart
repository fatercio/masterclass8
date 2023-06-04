import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  stdout.writeln("Calculadora de Indice de Massa Corpocal (IMC):");
  IMC.calcularIMC();
}

class IMC {
  static void calcularIMC() {
    stdout.write("\nQual a sua altura ex. (1.57): ");
    double altura = double.parse(stdin.readLineSync()!);
    stdout.write("\nQual o seu peso ex.(64.5): ");
    double peso = double.parse(stdin.readLineSync()!);
    var imc = (peso / pow(altura, 2));
    stdout.writeln("\nO RESULTADO DO SEU IMC É: ");
    if (imc < 18.5) {
      stdout.write("MAGREZA");
    } else if (imc >= 18.5 && imc < 24.9) {
      stdout.write("NORMAL");
    } else if (imc > 24.9 && imc < 29.9) {
      stdout.write("SOBREPESO");
    } else if (imc > 29.9 && imc < 39.9) {
      stdout.write("OBESIDADE");
    } else if (imc > 40) {
      stdout.write("OBESIDADE GRAVE");
    } else {
      stdout.write("OBESIDADE GRAVE:");
    }
  }
}
