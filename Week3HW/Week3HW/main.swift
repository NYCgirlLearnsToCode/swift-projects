//
//  main.swift
//  Week3HW
//
//  Created by Lisa J on 10/8/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

func random(opString: String) -> (Double, Double) -> Double {
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
    var gameOp = [1:"+",2:"-", 3:"*",4:"/"]
    var randomNum = Int(arc4random_uniform(4) + 1)
    var randomGameOp = gameOp[randomNum]
    print(randomGameOp)
    var game = true
    var calcOn = true
    calculator: while calcOn == true {
        //calculator: while userInputIsBad {// loop is named calculator
        print("Hello! I am a calculator. Please input a number, operand (+, -, *, /) and number! Example: 5 + 3")
        let userInput:String? = readLine()//readline is always optional
        if let safeUserInput = userInput {
            var safeInputAsArray: [String?] = safeUserInput.components(separatedBy: " ")//has to be optional bc values can still be nil
            //print(safeInputAsArray)
            //check arr.count == 3
            if safeInputAsArray.count == 3 {//reg calculator
                //makes sure the below isn't nil
                if let num1 = safeInputAsArray[0], let operand = safeInputAsArray[1], let num2 = safeInputAsArray[2] {
                    if let num1 = Double(num1), let num2 = Double(num2) {
                        //this is where the calc lives
                        if operand == "?" {
                            print("You have triggered the mini-game! Guess what operator is used!")
                            while game == true {
                                var userInGuessGame = ""
                                
                                
                                let randomGame = random(opString: randomGameOp!)
                                print("\(safeUserInput) = \(randomGame(Double(num1),Double(num2)))")
                                userInGuessGame = readLine()!.lowercased()
                                print(userInGuessGame)
                                if userInGuessGame == randomGameOp {
                                    print("you win!, play again? yes")
                                    let playAgain = readLine()!.lowercased()
                                    if playAgain == "yes" {
                                    continue
                                    }
                                    
                                }else{
                                    print("Wrong! Try again")
                                    continue
                                }
                            }
                            
                        }
                        let doTheMath = mathStuffFactory(opString: operand)
                        
                        print("\(safeUserInput) = \(doTheMath(Double(num1),Double(num2)))")
                    }else{
                        print("numbers only! try again")
                    }
                }
                //arr.ccount==5
            }
            if safeInputAsArray.count == 5 {//higher ordered function
            }
            // print("not working, try again")
            //continue calculator//continues calculator loop bc it's named
            
            //    let userInputAsArray = userInput.components(separatedBy: " ")
            //  print(userInputAsArray)
        }
}
