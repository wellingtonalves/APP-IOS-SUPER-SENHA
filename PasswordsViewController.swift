//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Wellington Alves on 16/07/21.
//

import UIKit

class PasswordsViewController: UIViewController {
    @IBOutlet weak var resultadoSenhas: UITextView!
    var totalCaracteres: Int = 10
    var totalSenhas: Int = 1
    var usarLestrasMinusculas: Bool!
    var usarNumeros: Bool!
    var usarLestrasMaiusculas: Bool!
    var usarCarateresEspeciais: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Número de Senhas: \(totalSenhas)"
        passwordGenerator = PasswordGenerator(totalCaracteres: totalCaracteres, usarLestrasMinusculas: usarLestrasMinusculas, usarNumeros: usarNumeros, usarLestrasMaiusculas: usarLestrasMaiusculas, usarCarateresEspeciais: usarCarateresEspeciais)
        gerarSenhasRandom()
    }
    
    func gerarSenhasRandom(){
        resultadoSenhas.scrollRangeToVisible(NSRange(location: 0, length: 0))
        resultadoSenhas.text = ""
        let passwords = passwordGenerator.gerar(total: totalSenhas)
        for password in passwords {
            resultadoSenhas.text.append(password + "\n\n")
        }
    }
    
    @IBAction func gerarSenha(_ sender: Any) {
        gerarSenhasRandom()
    }
}
