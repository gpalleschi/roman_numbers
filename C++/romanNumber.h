class romanNumber {

      private:
             const char *RN[13] = {"I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"};
             const short VRN[13] = {1,4,5,9,10,40,50,90,100,400,500,900,1000};
             const short TOTRN = 12;
             std::vector<const char *> retRN = {};
      public:
             romanNumber();
             ~romanNumber();
             int romanToDecimal(char *);
             std::vector<const char *> decimalToRoman(int);

};
