//
//  TagViewController.swift
//  appCelularRegistrado
//
//  Created by renanjunior on 03/02/16.
//  Copyright © 2016 celularegistrado.com.br. All rights reserved.
//

import UIKit
import AVFoundation

import SwiftyJSON

class TagViewController : UIViewController{
    
    var a : JSON = JSON.null
    let parse:ParseModels = ParseModels()
    let ws:AppService = AppService()
    var celular:Celular!
    @IBOutlet var campo_busca:UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func getCelular(sender: AnyObject){
        ws.getCelularQRCode(
            {retorno in
                self.a = retorno!
                print(self.a)
                print(self.a["nome_fabricante"])
                self.celular = self.parse.parseCelular(self.a)
                if(self.celular != nil){
                    self.performSegueWithIdentifier("Resultado", sender: self)
                }
                return
            }, tipo: campo_busca.text!)
     }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Resultado" {
            let childViewController = segue.destinationViewController as! ResultadoViewController
            childViewController.celular = self.celular
        }
        
    }
    
    
}