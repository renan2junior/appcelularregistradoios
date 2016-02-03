//
//  ResultadoViewController.swift
//  appCelularRegistrado
//
//  Created by Renan Junior on 03/02/16.
//  Copyright © 2016 celularegistrado.com.br. All rights reserved.
//

import UIKit


class ResultadoViewController: UIViewController {
    
    var celular:Celular?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        print(celular?.nome_fabricante)
    
    }
    
    
    

}