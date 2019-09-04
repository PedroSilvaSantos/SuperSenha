//
//  ViewController.swift
//  SuperSenha
//
//  Created by Pedro Silva Dos Santos on 01/09/2019.
//  Copyright © 2019 Pedro Silva Dos Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfTotalPasswords: UITextField!
    @IBOutlet var tfNumberOfCaracters: UITextField!
    @IBOutlet var swLetters: UISwitch!
    @IBOutlet var swNumbers: UISwitch!
    @IBOutlet var swCapitalLetters: UISwitch!
    @IBOutlet var swSpecialCharacters: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    //enviar informacoes de uma tela para outra, antes que essa tela seja exibida para cliente
    //nesse momento vou recuperar a tela e atualizar informacoes nela
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //criar uma referencia da View que vou mostrar
        let passwordsViewController = segue.destination as! PasswordsViewController

        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            passwordsViewController.numberOfPassword = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(tfNumberOfCaracters.text!) {
            passwordsViewController.numberOfCharacaters = numberOfCharacters
        }
        
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        view.endEditing(true) //remover o foco do teclado ao fim da consulta na view
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
        tfTotalPasswords.resignFirstResponder()
        tfNumberOfCaracters.resignFirstResponder()
    }

    
    @IBAction func sair(_ sender: Any) {
        createAlert(title: "Gerador de senhas", message: "Deseja realmente sair do aplicativo?")
    }
    
    
    func createAlert(title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Sim", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            exit(-1)
        }))
        
        alert.addAction(UIAlertAction(title: "Não", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //permitir retornar a tela de qlq lugar que eu estiver
    @IBAction func unwindView1(segue: UIStoryboardSegue) {
        
    }
}

