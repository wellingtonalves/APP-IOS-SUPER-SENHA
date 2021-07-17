//
//  ViewController.swift
//  SuperSenha
//
//  Created by Wellington Alves on 16/07/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var qntSenhas: UITextField!
    @IBOutlet weak var maxCaracteres: UITextField!
    @IBOutlet weak var usarLetrasMinusculas: UISwitch!
    @IBOutlet weak var usarNumeros: UISwitch!
    @IBOutlet weak var usarLetrasMaiusculas: UISwitch!
    @IBOutlet weak var usarCaracteresEspeciais: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        if let totalSenhas = Int(qntSenhas.text!) {
            passwordsViewController.totalSenhas = totalSenhas
        }
        
        if let totalCaracteres = Int(maxCaracteres.text! ){
            passwordsViewController.totalCaracteres = totalCaracteres
        }
        
        passwordsViewController.usarLestrasMinusculas = usarLetrasMinusculas.isOn
        passwordsViewController.usarLestrasMaiusculas = usarLetrasMaiusculas.isOn
        passwordsViewController.usarNumeros = usarNumeros.isOn
        passwordsViewController.usarCarateresEspeciais = usarCaracteresEspeciais.isOn
        view.endEditing(true)
    }
    
    @IBAction func gerarSenhas(_ sender: Any) {
    }
    
}

