// ignore_for_file: non_constant_identifier_names

import 'package:fraction/fraction.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

String Risultato(
    {required String x1,
    required String y1,
    required String q1,
    required String x2,
    required String y2,
    required String q2}) {
  String risultato = "";

  double x1int = Fraction.fromString(x1).toDouble();
  double y1int = Fraction.fromString(y1).toDouble();
  double q1int = Fraction.fromString(q1).toDouble();
  double x2int = Fraction.fromString(x2).toDouble();
  double y2int = Fraction.fromString(y2).toDouble();
  double q2int = Fraction.fromString(q2).toDouble();

  double Determinante = (x1int * y2int) + (y1int * x2int * -1);
  double Determinantex = (q1int * y2int) + (y1int * q2int * -1);
  double Determinantey = (x1int * q2int) + (q1int * x2int * -1);

  if (Determinante == 0) {
    if (Determinantex == 0) {
      risultato = "Indeterminato";
      return risultato;
    } else {
      risultato = "Impossibile";
      return risultato;
    }
  } else {
    double px = Determinantex / Determinante;
    double py = Determinantey / Determinante;
    risultato = ("Soluzione del sistema: x: " +
        Fraction.fromDouble(px).toString() +
        " y: " +
        Fraction.fromDouble(py).toString());
    return risultato;
  }
}

calcoloPunti(double x, double y, double q, String nretta) {
  double py;
  double px;

  if (nretta == "1") {
    for (double i = 0; i < 7; i++) {
      px = i;
      py = (x * i * -1) +
          q; // x*1*-1 perche' quando costruisce le rette si aspetta un' equazione impostata y=x+q ma riceve -x+y=q
      py = py / y; // dunque e' necessario cambiare segno ad x

      cpunti1.add(Punto(px, py));
    }
  }
  if (nretta == "2") {
    for (double i = 0; i < 7; i++) {
      px = i;
      py = (x * i * -1) + q;
      py = py / y;
      cpunti2.add(Punto(px, py));
    }
  }
}

class Punto {
  double x;
  double y;
  Punto(this.x, this.y);
}

List<Punto> cpunti1 = [];
List<Punto> cpunti2 = [];
List<Punto> vuota = [];
List<Punto> info = [Punto(0,-1),Punto(1,0),Punto(2,1),Punto(3,2),Punto(4,3),Punto(5,4),Punto(6,5),Punto(7,6),Punto(8,7),Punto(9, 8)];
List<Punto> info1 = [Punto(0,9),Punto(1,8),Punto(2,7),Punto(3, 6),Punto(4,5),Punto(5,4),Punto(6,3),Punto(7,2),Punto(8,1),Punto(9, 0)];

void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    await Future.delayed(const Duration(seconds: 1));
  
    FlutterNativeSplash.remove();
  }
