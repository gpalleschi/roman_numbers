#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char* RN[] = {"I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"};
const short VRN[]={1,4,5,9,10,40,50,90,100,400,500,900,1000};
const short TOTRN=12;

char *decimalToRoman(int number)
{
    int ind=TOTRN;
    char *retRN = NULL;
    int posRN = 0;
    while(number>0) {
      int div = number/VRN[ind];
      number = number%VRN[ind];
      while(div--) {
        /* Remember to free this area after used */
        if ( (retRN = realloc(retRN,posRN+strlen(RN[ind])+1)) == NULL ) {
          retRN=NULL;
          break;
        }
        strcpy(&retRN[posRN],RN[ind]);
        posRN+=strlen(RN[ind]);
      }
      ind--;
    }
    return retRN;
}

int romanToDecimal(char *cpRN) {
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
/* 
TO TEST
void *main(int argc, char**argv) {
  printf("\n Roman Number %s : %d\n",argv[1],romanToDecimal(argv[1]));
  printf("\n Roman Number %s : %d\n",argv[1],romanToDecimal2(argv[1]));
}	
*/