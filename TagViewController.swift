//
//  TagViewController.swift
//  appCelularRegistrado
//
//  Created by renanjunior on 03/02/16.
//  Copyright © 2016 celularegistrado.com.br. All rights reserved.
//

import UIKit
import AVFoundation
import PKHUD


import SwiftyJSON

class TagViewController : UIViewController, UITextFieldDelegate {
    
    var a : JSON = JSON.null
    let parse:ParseModels = ParseModels()
    let ws:AppService = AppService()
    var celular:Celular!
    @IBOutlet var campo_busca:UITextField!
    @IBOutlet var label_sinalizador:UILabel!
    @IBOutlet var label_sinalizador2:UILabel!

    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        campo_busca.delegate=self
          }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func getCelular(sender: AnyObject){
        
        let campo_string: String  = campo_busca.text!
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        if(campo_string.characters.count >= 5) {
            label_sinalizador.backgroundColor = UIColor.greenColor()
            label_sinalizador2.textColor = UIColor.greenColor()
            if(Reachability().isConnectedToNetwork()){
                ws.getCelularTag(
                    {retorno in
                        self.a = retorno!
                        self.celular = self.parse.parseCelular(self.a)
                        if(self.celular != nil && self.celular.imei_celular != "" ){
                            self.performSegueWithIdentifier("Resultado", sender: self)
                        }else{
                            let alert = UIAlertView()
                            alert.title =  "Atenção"
                            alert.message = "Celular não encontrado com essa TAG."
                            alert.addButtonWithTitle("OK")
                            alert.show()
                        }
                        return
                    }, tipo: campo_busca.text!)
            } else{
                
                let alert = UIAlertView()
                alert.title =  "Ops!"
                alert.message = "Ocorreu um erro de rede."
                alert.addButtonWithTitle("OK")
                alert.show()
            }
        }else{
            label_sinalizador.backgroundColor = UIColor.redColor()
            label_sinalizador2.textColor = UIColor.redColor()
            let alert = UIAlertView()
            alert.title =  "Ops!"
            alert.message = "Campo deve conter 5 caracteres."
            alert.addButtonWithTitle("OK")
            alert.show()
            
        }
         PKHUD.sharedHUD.hide();
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Resultado" {
            let childViewController = segue.destinationViewController as! ResultadoViewController
            childViewController.celular = self.celular
        }
        
    }
    
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
