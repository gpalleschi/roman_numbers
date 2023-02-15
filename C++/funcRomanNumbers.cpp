#include <cstring>
#include <vector>
#include <iostream>
#include <numeric>
#include "romanNumber.h"

std::vector<const char *> romanNumber::decimalToRoman(int number)
{
    int ind=TOTRN;
    while(number>0) {
      int div = number/VRN[ind];
      number = number%VRN[ind];
      while(div--) {
        retRN.push_back(RN[ind]);
      }
      ind--;
    }
    return retRN;
}

int romanNumber::romanToDecimal(char *cpRN) {
  int lenRN = strlen(cpRN);
  int retDEC = 0;
  for (int i = 0; i < lenRN; i++) {
      switch (cpRN[i]) {
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

      if ( i > 0 ) {

         if ((cpRN[i] == 'V' || cpRN[i] == 'X') && cpRN[i - 1] == 'I') {
            retDEC -= 1 + 1;
         }
 
         if ((cpRN[i] == 'L' || cpRN[i] == 'C') && cpRN[i - 1] == 'X') {
            retDEC -= 10 + 10;
         }

         if ((cpRN[i] == 'D' || cpRN[i] == 'M') && cpRN[i - 1] == 'C') {
            retDEC -= 100 + 100;
         }
      }
  }
  return retDEC;
}

romanNumber::romanNumber() {
//  std::cout << "\nCostruttore\n";
  retRN.clear();
}

romanNumber::~romanNumber() {
//  std::cout << "\nDistruttore\n";
  retRN.clear();
}

// TO TEST
int main(int argc, char**argv) {

  romanNumber myRN;

  int decNum = myRN.romanToDecimal(argv[1]);
  std::vector<const char *> vec = myRN.decimalToRoman(decNum);
  std::string tradDR = std::accumulate(vec.begin(), vec.end(), std::string(""));

  std::cout << "\n Roman Number " << argv[1] << " : " << decNum << "\n";
  std::cout << "\n Decimal Number " << decNum << " : " << tradDR << "\n";

  std::cout << "\n";

  return(0);
}	