//
//  ResultadoViewController.swift
//  appCelularRegistrado
//
//  Created by Renan Junior on 03/02/16.
//  Copyright © 2016 celularegistrado.com.br. All rights reserved.
//

import UIKit
import AlamofireImage




class ResultadoViewController: UIViewController {
    
    var celular:Celular?
    
    
    @IBOutlet var nome:UILabel!
    @IBOutlet var status:UILabel!
    @IBOutlet var imei:UILabel!
    @IBOutlet var operadora:UILabel!
    @IBOutlet var modelo:UILabel!
    @IBOutlet var alerta:UILabel!
    @IBOutlet weak var avatarImgView:UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let verde = UIColor(red: 81/255.0, green: 226/255.0, blue: 56/255.0, alpha: 1.0)
        
        print(celular?.nome_fabricante!)
        
       

        if((celular?.alerta_celular)! == "0"){
            status.text = "Regular"
            status.textColor = verde
            alerta.text = "CELULAR REGISTRADO"
            alerta.backgroundColor = verde
        }else{
            status.textColor = UIColor.redColor()
            status.text = "Roubado"
            alerta.text = "CELULAR ROUBADO"
            alerta.backgroundColor = UIColor.redColor()

        }
        
        nome.text = celular?.nome_usuario
        imei.text = celular?.imei_celular
        operadora.text = celular?.nome_operadora
        modelo.text = celular?.nome_modelo
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        setUpImageView()
      
    }
    
   
    
    private func setUpImageView() {
        let URL = NSURL(string: celular!.imagem_usuario!)!
        avatarImgView.af_setImageWithURL(URL)
        
        avatarImgView.layer.borderColor = UIColor.whiteColor().CGColor
        //avatarImgView.layer.borderWidth = 5.0
        self.avatarImgView.layer.cornerRadius = self.avatarImgView.frame.size.width / 2;
        
        
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    

}