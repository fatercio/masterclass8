import 'dart:io';

void main(List<String> arguments) {
  stdout.writeln("Sequência Fibonacci: ");

  Fibonacci fibonacci = new Fibonacci();
  fibonacci.calcularSequencia();
}

class Fibonacci {
  var terms;
  var atual = 1;
  var contador = 0;
  var antecessor = 0;
  var sucessor = 0;

  calcularSequencia() {
    stdout.write("\nQual a quantidade de termos da sequância: ");
    terms = int.parse(stdin.readLineSync()!);
    this.terms = terms;
    calc(atual);
  }

  int calc(atual) {
    if (terms == contador) {
      return atual;
    }
    contador++;
    print(antecessor);
    sucessor = atual + antecessor;

    antecessor = atual;

    return calc(sucessor);
  }
}
