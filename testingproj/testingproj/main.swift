print("Hello, World!")
func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}
var higherOrderFunctions = ["map", "reduce", "filter"]
var userInputIsBad = true
calculator: while userInputIsBad {// loop is named calculator
    print("Hello! I am a calculator. Please input a number, operand (+, -, *, /) and number! Example: 5 + 3")
    guard let userInput:String = readLine(), userInput.count > 1 else {
        print("not working, try again")
        continue calculator//continues calculator loop bc it's named
    }
    let userInputAsArray = userInput.components(separatedBy: " ")
    print(userInputAsArray)
    
    //if count is 5 then its a higher ordered func & should check for that
    
    
    
    if userInputAsArray.count == 3 { // there are the correct number of things in the array
        //        var num1 = userInputAsArray[0]
        //        var num2 = userInputAsArray[2]
        var operand = userInputAsArray[1]
        if let num1 = Double(userInputAsArray[0]), let num2 = Double(userInputAsArray[2]) {
            
            
            
            //filter charsetso it doesnt take letters
            //            for i in userInputAsArray{
            //                switch i {
            //                case "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t" , "u", "v", "w", "x", "y", "z":
            //                    print("no letters allowed")
            //                    userInputIsBad = true
            //                    continue
            //                default:
            //                    userInputIsBad = false
            //                    break
            //                }
            //            }
            
            if userInputIsBad == false {
                let doTheMath = mathStuffFactory(opString: operand)
                //            if let num1 = num1, let num2 = num2
                print("\(userInput) = \(doTheMath(Double(num1)!,Double(num2)!))")
            }else{
                print("Try again!")
            }
            
            
            
            
        }
        
    }
    
}

