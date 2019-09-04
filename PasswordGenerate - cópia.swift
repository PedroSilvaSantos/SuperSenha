//
//  PasswordGenerate.swift
//  SuperSenha
//
//  Created by Pedro Silva Dos Santos on 01/09/2019.
//  Copyright © 2019 Pedro Silva Dos Santos. All rights reserved.
//

import Foundation
class PasswordGenerator {
    //logica do projeto
    
    var numberOfCharacaters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    //Array para armazenar todas as senhas que forem geradas.
    var passwords:[String] = []
    
    private let letters = "abcdefghijlmnopqrstuvwxyz"
    private let specialCharacters = "`@#$%ˆ&**()_+?<>:;'"
    private let numbers = "0123456789"
    
    init(numberOfCharacaters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        var numchars = min(numberOfCharacaters, 16) //recebe o menor entre os dois numeros
        numchars = max(numchars, 1) //irei receber o meu proprio valor, ou 1 senha apenas
        
        self.numberOfCharacaters = numchars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] {
        //primeiro lugar, limpar as senhas antigas
        passwords.removeAll()
        
        //universo de caracteress
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        if useNumbers {
            universe += numbers
        }
        if useSpecialCharacters {
            universe += specialCharacters
        }
        if useCapitalLetters {
            universe += letters.uppercased() //letras maiusculas
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password: String = "" //receberá a variave que esta ono indice do array universeArray
            for _ in 1...numberOfCharacaters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count))) //indice de uma letra aleatoria dentro do for
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
