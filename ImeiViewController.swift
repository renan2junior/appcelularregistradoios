//
//  ImeiViewController.swift
//  appCelularRegistrado
//
//  Created by Renan Junior on 03/02/16.
//  Copyright © 2016 celularegistrado.com.br. All rights reserved.
//

import UIKit
import AVFoundation

import SwiftyJSON

class ImeiViewController : UIViewController{
    
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
        if(Reachability().isConnectedToNetwork()){
            ws.getCelularImei(
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
        } else{
            
            let alert = UIAlertView()
            alert.title =  GlobalVariables.sharedInstance.TITULO_ALERT_ERROR
            alert.message = GlobalVariables.sharedInstance.MSG_ERROR
            alert.addButtonWithTitle("OK")
            alert.show()
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Resultado" {
            let childViewController = segue.destinationViewController as! ResultadoViewController
            childViewController.celular = self.celular
        }
        
    }
    
    
}
