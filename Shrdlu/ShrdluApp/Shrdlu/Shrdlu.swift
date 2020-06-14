//
//  Shrdlu.swift
//  Shrdlu
//
//  Created by Park, Sunghyun on 3/10/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import Foundation

class Shrdlu{
    
    var response: String
    var inputText: String
    
    var inputString: [String]
    var outputString: [String]
    var userInput: String
    var computerAnswer: String
    
    let startWords: [String] = ["hello", "hi"]
    let joyWords: [String] = ["happy", "happiness", "joy", "yay", "yeah"]
    let disgustWords: [String] = ["antipathy", "revulsion", "dislike", "distaste", "hatred"]
    let fearWords: [String] = ["anxiety", "dismay", "doubt", "despair", "concern"]
    let angerWords: [String] = ["acrimony", "animosity", "annoyance", "antagonism", "displeasure"]
    let sadnessWords: [String] = ["anguish", "grief", "hopelessness", "misery", "mourning"]
    
    init(){
        self.response = "what do you need?"
        self.inputText = ""
        self.inputString = []
        self.outputString = []
        self.userInput = ""
        self.computerAnswer = ""
    }
    func getWordsFromString(userInput: String) -> [String] {
        let inputLowerCase = userInput.lowercased()
        let inputWithoutNewline = inputLowerCase.components(separatedBy: "\n")
        let inputWords = inputWithoutNewline[0].components(separatedBy: " ")
        return inputWords
    } 
    
    
    func oneInteraction(userInput: String) -> String {
        self.inputText = userInput
        self.inputString.append(userInput)
        parseTheInput()
        self.outputString.append(self.computerAnswer)
        print(outputString)
        return (userInput)  + "\n" +  (computerAnswer)
    }


    func parseTheInput () {
        let individualWords = getWordsFromString(userInput: inputText)
        
        for myWord in individualWords {
            if (startWords.contains(myWord)){
                self.computerAnswer = "> Hello! How are you today?"
            }else if (joyWords.contains(myWord)){
            self.computerAnswer = ">I am happy to here that you're \(myWord)"
           }else if (disgustWords.contains(myWord)){
             self.computerAnswer = "> I am so bad to here that you're \(myWord)"
           }else if (fearWords.contains(myWord)){
              self.computerAnswer = "> I am so scared to here that you're \(myWord)"
           }else if (angerWords.contains(myWord)){
              self.computerAnswer = "> I am so angry to here that you're \(myWord)"
           }else if (sadnessWords.contains(myWord)){
             self.computerAnswer = "> I and so sad to here that you're \(myWord)"
           }else {
            self.computerAnswer = "> I have no idea"
            }
    }
    
    func inputString() -> [String] {
        return self.inputString
    }

    func outputString() -> [String] {
        return self.outputString
    }
}

}
