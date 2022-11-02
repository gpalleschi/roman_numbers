function decimalToRoman( number ) {
  const RN = ['I','IV','V','IX','X','XL','L','XC','C','CD','D','CM','M'];
  const VRN =[1,4,5,9,10,40,50,90,100,400,500,900,1000];
  var div=0;

  var ind = RN.length-1;
  var retRN = '';

  while ( number > 0 ) {
	  div = Math.floor(number/VRN[ind]);
	  number=number%VRN[ind];

	  while ( div-- ) {
	    retRN = retRN + RN[ind];
  	}
	  ind--;
  }

  return retRN;
}

function romanToDecimal( RN ) {
  var retDEC = 0;
  for (let i = 0; i < RN.length; i++) {

      switch (RN.charAt(i)) {
             case 'I':
		  retDEC=retDEC+1;
                  break;
             case 'V':
		  retDEC=retDEC+5;
                  break;
             case 'X':
		  retDEC=retDEC+10;
                  break;
             case 'L':
		  retDEC=retDEC+50;
                  break;
             case 'C':
		  retDEC=retDEC+100;
                  break;
             case 'D':
		  retDEC=retDEC+500;
                  break;
             case 'M':
		  retDEC=retDEC+1000;
                  break;
             default:
		  return -1;
      }
      if ( i ) {
         if ((RN.charAt(i) === 'V' || RN.charAt(i) === 'X') && RN.charAt(i - 1) === 'I') {
            retDEC -= 1 + 1;
         }
         if ((RN.charAt(i) === 'L' || RN.charAt(i) === 'C') && RN.charAt(i - 1) === 'X') {
            retDEC -= 10 + 10;
         }
         if ((RN.charAt(i) === 'D' || RN.charAt(i) === 'M') && RN.charAt(i - 1) === 'C') {
            retDEC -= 100 + 100;
         }
      }
  }

  return retDEC;
}

