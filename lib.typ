/* Digit2Txt - Writes out ints as full written words, works from 0-999, This is all I need right now, but if someone wants to update this let me know.
*/

//Simple array for one through nine
#let oneThroughNine(dig) = {
  let arr = ("","One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine")
  arr.at(dig)
}
//Probably don't need this as a function, but it's staying for now (Onlu gets called once)
#let extractLastDig(dig) = {
    let dig_str = str(dig)
    dig_str = dig_str.last()
    int(dig_str)
}
//This one is a bit more complicated
#let oneThroughNinetyNine(dig) = {
  //1-10
  if dig > 0 and dig < 10 {
    oneThroughNine(dig)
  }
  //10-20 Simple Array Like 1-9
  else if dig >= 10 and dig < 20 {
    dig = dig - 10 
    let arr = ("Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen")
    arr.at(dig)
  }
  //this handles 20-99 Finally, splits the digits from each other and then uses the oneThroughNine Function
  else if dig >=20 and dig < 100 {
    let ld = extractLastDig(dig)
    let fd = int(dig / 10 -2)
    let arr = ("Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety")
    arr.at(fd) + [ ] + oneThroughNine(ld)
  }
}

// Works the same as 20-99 but extracts the last 2 digits and passes it to the oneThroghNinteyNine Function
#let oneThroughNineHundredNinetyNine(dig) = {
  let fd = int(dig / 100)
  let ld = int(str(dig).slice(1))
  oneThroughNine(fd) + [ Hundred ] + oneThroughNinetyNine(ld)
}

//Finally This is the one you should call in your document
#let dig2txt(dig) = {
  // Handles Zero
  if dig == 0 {
    [Zero]
  }
  // Handles one throuh Nintey Nine
  else if dig > 0 and dig < 100 {
    oneThroughNinetyNine(dig)
  }
  //Handles 100-999
  else if dig >= 100 and dig < 1000 {
    oneThroughNineHundredNinetyNine(dig)
}
}