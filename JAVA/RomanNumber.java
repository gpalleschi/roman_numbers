class RomanNumber {

    String[] rn = {"I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"};
    int[] vrn = {1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000};

    int romanToDecimal(String rnToConv) {
        int retDEC = 0;
        for (int i = 0; i < rnToConv.length(); i++) {
          switch (rnToConv.charAt(i)) {
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
            if ((rnToConv.charAt(i) == 'V' || rnToConv.charAt(i) == 'X') && rnToConv.charAt(i-1) == 'I') {
              retDEC -= 1 + 1;
            }

            if ((rnToConv.charAt(i) == 'L' || rnToConv.charAt(i) == 'C') && rnToConv.charAt(i-1) == 'X') {
              retDEC -= 10 + 10;
            }

            if ((rnToConv.charAt(i) == 'D' || rnToConv.charAt(i) == 'M') && rnToConv.charAt(i-1) == 'C') {
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
          int div = number / vrn[ind];
          number = number % vrn[ind];
          while (div-- > 0) {
                retRN = retRN + rn[ind];
          }
          ind--;
        }
        return retRN;
    }

    // public static void main(String[] args) {

    //     RomanNumber myRN = new RomanNumber();

    //     if ( args.length > 0 ) {
    //        int retDec = myRN.romanToDecimal(args[0]);
    //        System.out.println("Roman : " + args[0] + " Decimal : " + retDec);
    //        System.out.println("Decimal : " + retDec + " Roman : " + myRN.decimalToRoman(retDec));
    //     } else {
    //        System.out.println("Pass String with a number in Roman Format");
    //     }

    // }
}

