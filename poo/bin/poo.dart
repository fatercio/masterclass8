import 'dart:io';

void main(List<String> arguments) {
  String text;
  stdout.write("\n-----------------------------------------------");
  stdout.write("\nValidação de CPF ");
  stdout.write("\n-----------------------------------------------");
  stdout.write("\nDigite o CPF: ");
  text = (stdin.readLineSync())!;
  var cpf = CPF(cpf: text);
  print(cpf.validate() == true ? "CPF é valido" : "CPF inválido");
}

class CPF {
  final String cpf;
  CPF({required this.cpf});

  String executarCalculoDigitoVerificador() {
    //cálculo do primeiro digito verificador
    String digito1 = executarCalculoPrimeiroDigito();
    //cálculo do segundo dígito verificador
    String digit2 = executarCalculoSegundoDigito();
    return (digito1 + digit2);
  }

  // Validação do dígito verificador do cpf em confronto com o valor calculado
  bool validate() {
    bool valid = false;
    String inputDigit = cpf.substring(12, 14);
    if (inputDigit == executarCalculoDigitoVerificador()) {
      valid = true;
    }
    return valid;
  }

  String executarCalculoPrimeiroDigito() {
    String numero = cpf.substring(0, 11).replaceAll('.', '');

    var multiplicador = 2;
    var somatorio = 0;
    String digito = '';

    for (var i = numero.length; i >= 1; i--) {
      var pos = numero.length;
      somatorio =
          somatorio + int.parse(numero.substring(i - 1, i)) * multiplicador;
      multiplicador++;
    }

    if (somatorio % 11 < 2) {
      digito = 0.toString();
    } else {
      digito = (11 - (somatorio % 11)).toString();
    }
    return digito;
  }

  String executarCalculoSegundoDigito() {
    String numero =
        cpf.substring(0, 13).replaceAll('.', '').replaceAll('-', '');

    var multiplicador = 2;
    var somatorio = 0;
    String digito = 0.toString();

    for (var i = numero.length; i >= 1; i--) {
      var pos = numero.length;
      somatorio =
          somatorio + int.parse(numero.substring(i - 1, i)) * multiplicador;
      multiplicador++;
    }

    if (somatorio % 11 < 2) {
      digito = 0.toString();
    } else {
      digito = (11 - (somatorio % 11)).toString();
    }
    return digito;
  }
}
