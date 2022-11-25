// To use Test main function
//use std::env;

fn decimal_to_roman(number: i32) -> String {
	let rn: [&str; 13] = ["I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"];
	let vrn: [i32; 13] = [1,4,5,9,10,40,50,90,100,400,500,900,1000];
	let totrn: usize = 12;

	let mut ind: usize = totrn;
	let mut retrn = "".to_string();
	let mut value = number;

	while value > 0 {
		let mut div: i32 = value/vrn[ind];
		value = value % vrn[ind];

		while div > 0 {
			retrn.push_str(rn[ind]);
			div = div - 1;
		}
  
		if  ind > 0 {
		    ind = ind - 1;
		}
	}
	return retrn;
}

fn roman_to_decimal(cprn: String) -> i32 {
	let lenrn = cprn.chars().count();
	let mut retdec: i32 = 0;

	for i in 0..lenrn {
		let char_rom = cprn.chars().nth(i).unwrap();
	        match char_rom {
			'I'=> retdec+=1,
			'V'=> retdec+=5,
			'X'=> retdec+=10,
			'L'=> retdec+=50,
			'C'=> retdec+=100,
			'D'=> retdec+=500,
			'M'=> retdec+=1000,
			_=> retdec+=0,
		}		

		if i > 0  {
			let char_ant = cprn.chars().nth(i-1).unwrap();
			if (char_rom == 'V' || char_rom == 'X') && char_ant == 'I' {
			   retdec -=1 + 1;
			} else {
				if (char_rom == 'L' || char_rom == 'C') && char_ant == 'X' {
				   retdec -= 10 + 10;
			        } else {
					if (char_rom == 'D' || char_rom == 'M') && char_ant == 'C' {
					   retdec -= 100 + 100;
					}
				}
			}
		}
	}

	return retdec;
}

//fn main() {
//	let args: Vec<String> = env::args().collect();
//	let dec_num: i32;
//
//	if args.len() > 1 {
//	   dec_num = roman_to_decimal(args[1].to_string());
//	   println!("roman {} to decimal {}", args[1], dec_num);
//	} else {
//	   dec_num = roman_to_decimal("MCMLXXI".to_string());
//	   println!("roman {} to decimal {}", "MCMLXXI", dec_num);
//	}
//	let rom_num = decimal_to_roman(dec_num);
//	println!("decimal {} to roman {}", dec_num, rom_num);
//}