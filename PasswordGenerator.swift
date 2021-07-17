//
//  File.swift
//  SuperSenha
//
//  Created by Wellington Alves on 16/07/21.
//

import Foundation

class PasswordGenerator {
    var totalCaracteres: Int
    var usarLestrasMinusculas: Bool
    var usarNumeros: Bool
    var usarLestrasMaiusculas: Bool
    var usarCarateresEspeciais: Bool
    
    var passwords: [String] = []
    
    private let letras = "abcdefghijklmnopqrstuvwxyz"
    private let especiais = ".*+?[^]$(){}=!<>|:-"
    private let numeros = "0123456789"
    
    init(totalCaracteres: Int, usarLestrasMinusculas: Bool,usarNumeros: Bool,usarLestrasMaiusculas: Bool,usarCarateresEspeciais: Bool) {
        var numchars = min(totalCaracteres, 16)
        numchars = max(numchars, 1)
        
        self.totalCaracteres = numchars
        self.usarLestrasMinusculas = usarLestrasMinusculas
        self.usarLestrasMaiusculas = usarLestrasMaiusculas
        self.usarNumeros = usarNumeros
        self.usarCarateresEspeciais = usarCarateresEspeciais
    }
    
    func gerar(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if usarLestrasMinusculas {
            universe += letras
        }
        if usarCarateresEspeciais {
            universe += especiais
        }
        
        if usarLestrasMaiusculas {
            universe += letras.uppercased()
        }
        if usarNumeros {
            universe += numeros
        }
        
        if(universe.count == 0) {
            universe += letras + especiais + letras.uppercased() + numeros
        }
        
        let uniserverArray: Array = Array(universe)
        
        while passwords.count < total {
            var password: String = ""
            for _ in 1...totalCaracteres {
                let index = Int(arc4random_uniform(UInt32(universe.count)))
                password += String(uniserverArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
}
