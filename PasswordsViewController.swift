//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Pedro Silva Dos Santos on 01/09/2019.
//  Copyright © 2019 Pedro Silva Dos Santos. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {
    
    @IBOutlet var tvPasswords: UITextView!
    @IBOutlet var actIndicator: UIActivityIndicatorView!
    @IBOutlet var generateBuuton: UIButton!
    @IBOutlet var dicasButton: UIButton!
    @IBOutlet var information: UIButton!
    
    var numberOfCharacaters: Int = 6
    var numberOfPassword: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if useLetters || useNumbers || useCapitalLetters || useSpecialCharacters {
            title = "Senhas Geradas: \(numberOfPassword)"
            tvPasswords.isHidden = false
            generateBuuton.isHidden = false
            dicasButton.isHidden = false
            information.isHidden = false
            passwordGenerator = PasswordGenerator(numberOfCharacaters: numberOfCharacaters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
            generatePassword()
        } else {
            title = "Ops!!!"
            createAlert(title: "Erro na consulta", message: "Para continuar, é necessario escolher pelo menos uma opção de formatação.")
        }
    }
    
    func createAlert(title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)//volta para tela anterior
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func generate(_ sender: Any) {
        actIndicator.startAnimating()
        generatePassword()
        actIndicator.hidesWhenStopped = true
    }
    
    func generatePassword() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0)) //leva o usuario para o inicio do textview
        tvPasswords.text = ""
        
        //criando variave para recuperar a quantidade de senhas a ser recuperads
        let passwords = passwordGenerator.generate(total: numberOfPassword)
        print("Vamos ver o que retorna nesse carinha", passwords)
        
        //varrer todas as senhas
        for password in passwords {
            //insere as senhas dentro do textview quebrando as linhas com espaço
            tvPasswords.text.append(password + "\n\n")
        }
        actIndicator.stopAnimating()
        actIndicator.isHidden = true
    }
}

