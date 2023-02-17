class romanNumber {
  List<String> rn = [
    "I",
    "IV",
    "V",
    "IX",
    "X",
    "XL",
    "L",
    "XC",
    "C",
    "CD",
    "D",
    "CM",
    "M"
  ];
  List<int> vrn = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000];

  int romanToDecimal(String rnToConv) {
    int retDEC = 0;
    for (int i = 0; i < rnToConv.length; i++) {
      switch (rnToConv[i]) {
        case 'I':
          retDEC += 1;
          break;
        case 'V':
          retDEC += 5;
          break;
        case 'X':
          retDEC += 10;
          break;
        case 'L':
          retDEC += 50;
          break;
        case 'C':
          retDEC += 100;
          break;
        case 'D':
          retDEC += 500;
          break;
        case 'M':
          retDEC += 1000;
          break;
        default:
          // Character not recognized
          return -1;
      }

      if (i > 0) {
        if ((rnToConv[i] == 'V' || rnToConv[i] == 'X') &&
            rnToConv[i - 1] == 'I') {
          retDEC -= 1 + 1;
        }

        if ((rnToConv[i] == 'L' || rnToConv[i] == 'C') &&
            rnToConv[i - 1] == 'X') {
          retDEC -= 10 + 10;
        }

        if ((rnToConv[i] == 'D' || rnToConv[i] == 'M') &&
            rnToConv[i - 1] == 'C') {
          retDEC -= 100 + 100;
        }
      }
    }
    return retDEC;
  }

  String decimalToRoman(int number) {
    int ind = rn.length - 1;
    String retRN = "";
    while (number > 0) {
      int div = number ~/ vrn[ind];
      number = number % vrn[ind];
      while (div-- > 0) {
        retRN = retRN + rn[ind];
      }
      ind--;
    }
    return retRN;
  }
}


// TO TEST
// void main() {
//   romanNumber myRN = romanNumber();

//   int retRN = myRN.romanToDecimal("XI");

//   String retDec = myRN.decimalToRoman(1234);

//   print("XI : $retRN ");
//   print("1234 : $retDec ");
// }
