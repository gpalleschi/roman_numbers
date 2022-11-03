#!/usr/bin/perl -w

@RN = ("I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M");
@VRN = (1,4,5,9,10,40,50,90,100,400,500,900,1000);
$TOTRN = 12;


sub decimalToRoman {
    my ($number) = @_;
    $ind = $TOTRN;
    $retRN = "";

    while ( $number > 0 ) {
      $div = int($number/$VRN[$ind]);
      $number = $number%$VRN[$ind];
      while ( $div ) {
	$retRN = $retRN . $RN[$ind];
	$div = $div - 1;
      }
      $ind = $ind - 1;
    }

    return $retRN;
}


sub romanToDecimal {
    my ($cpRN) = @_;

    $lenRN = length($cpRN);
    $retDEC = 0;

    for ( $ind=0; $ind < $lenRN; $ind++ ) {
#[]      printf("\n %d : %s \n", $ind, substr($cpRN, $ind, 1));
      if ( substr($cpRN, $ind, 1) eq 'I' ) {
        $retDEC = $retDEC + 1;
      }
      if ( substr($cpRN, $ind, 1) eq 'V' ) { 
        $retDEC = $retDEC + 5;
      }
      if ( substr($cpRN, $ind, 1) eq 'X' ) { 
        $retDEC = $retDEC + 10;
      }
      if ( substr($cpRN, $ind, 1) eq 'L' ) { 
        $retDEC = $retDEC + 50;
      }
      if ( substr($cpRN, $ind, 1) eq 'C' ) { 
        $retDEC = $retDEC + 100;
      }
      if ( substr($cpRN, $ind, 1) eq 'D' ) { 
        $retDEC = $retDEC + 500;
      }
      if ( substr($cpRN, $ind, 1) eq 'M' ) { 
        $retDEC = $retDEC + 1000;
      }

      if ( $ind > 0 ) {

         if ( (( substr($cpRN, $ind, 1) eq 'V') or ( substr($cpRN, $ind, 1) eq 'X')) && ( substr($cpRN, $ind-1, 1) eq 'I') ) {
            $retDEC -= 1 + 1;
         }

         if ( (( substr($cpRN, $ind, 1) eq 'L') or ( substr($cpRN, $ind, 1) eq 'C')) && ( substr($cpRN, $ind-1, 1) eq 'X') ) {
            $retDEC -= 10 + 10;
         }

         if ( (( substr($cpRN, $ind, 1) eq 'D') or ( substr($cpRN, $ind, 1) eq 'M')) && ( substr($cpRN, $ind-1, 1) eq 'C') ) {
            $retDEC -= 100 + 100;
         }
      }

    } 

    return $retDEC;
}

# TEST IT
#my $res = 0;
#
#$res = decimalToRoman(677);
#
#printf("\n%s\n",$res);
#
#$res = romanToDecimal("DCLXXVII");
#
#printf("\n%d\n",$res);
