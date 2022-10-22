CREATE OR REPLACE FUNCTION decimaltoroman (numberDec IN INTEGER)
RETURN VARCHAR2
IS
   retRN VARCHAR2(4096);
   type RN_type IS VARRAY(13) OF VARCHAR2(2); 
   type VRN_type IS VARRAY(13) OF INTEGER;
   RN RN_type := RN_type('I','IV','V','IX','X','XL','L','XC','C','CD','D','CM','M');
   VRN VRN_type := VRN_type(1,4,5,9,10,40,50,90,100,400,500,900,1000);
   DIV INTEGER;
   ind INTEGER;
   numberToConv INTEGER;
BEGIN
   ind := 13;
   retRN := '';
   numberToConv := numberDec;
   WHILE ind > 0 
   LOOP
         DIV := TRUNC(numberToConv/VRN(ind));
         numberToConv := MOD(numberToConv,VRN(ind));
         WHILE DIV > 0
         LOOP
              retRN := retRN || RN(ind);
              DIV:=DIV-1;
         END LOOP;
         ind := ind - 1;
   END LOOP;

   RETURN retRN;
END;
/

CREATE OR REPLACE FUNCTION romantodecimal (romannumber IN VARCHAR2)
RETURN INTEGER
IS
  lenRN INTEGER;
  retDEC INTEGER;
BEGIN

  retDEC := 0;

  FOR i IN 1..LENGTH(romannumber)
  LOOP
     IF SUBSTR(romannumber,i,1) = 'I' THEN
        retDEC := retDEC + 1;
     ELSIF SUBSTR(romannumber,i,1) = 'V' THEN
        retDEC := retDEC + 5;
     ELSIF SUBSTR(romannumber,i,1) = 'X' THEN
        retDEC := retDEC + 10;
     ELSIF SUBSTR(romannumber,i,1) = 'L' THEN
        retDEC := retDEC + 50;
     ELSIF SUBSTR(romannumber,i,1) = 'C' THEN
        retDEC := retDEC + 100;
     ELSIF SUBSTR(romannumber,i,1) = 'D' THEN
        retDEC := retDEC + 500;
     ELSIF SUBSTR(romannumber,i,1) = 'M' THEN
        retDEC := retDEC + 1000;
     ELSE
        RETURN -1;
     END IF;
     IF i > 1 THEN
        IF ( SUBSTR(romannumber,i,1) = 'V' OR  SUBSTR(romannumber,i,1) = 'X' ) AND SUBSTR(romannumber,i-1,1) = 'I' THEN
           retDEC := retDEC - 2;
        ELSIF ( SUBSTR(romannumber,i,1) = 'L' OR  SUBSTR(romannumber,i,1) = 'C' ) AND SUBSTR(romannumber,i-1,1) = 'X' THEN
           retDEC := retDEC - 20;
        ELSIF ( SUBSTR(romannumber,i,1) = 'D' OR  SUBSTR(romannumber,i,1) = 'M' ) AND SUBSTR(romannumber,i-1,1) = 'C' THEN
           retDEC := retDEC - 200;
        END IF;
     END IF;
  END LOOP;

  return retDEC;
END;
/