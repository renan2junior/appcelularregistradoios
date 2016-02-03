//
//  AppService.swift
//  appCelularRegistrado
//
//  Created by Renan Junior on 02/02/16.
//  Copyright © 2016 celularegistrado.com.br. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AppService {
    let parseVideo: ParseModels = ParseModels()
    
    let headers = ["Authorization":"Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==","Content-Type":"application/x-www-form-urlencoded"]
    var retorno:JSON = JSON.null


    func getCelularQRCode(completionHandler: (responseObject: JSON?) -> (), tipo:String) {
        makeCallTipo(completionHandler, tipo: tipo)
    }
    
    func makeCallTipo(completionHandler: (responseObject: JSON?) -> (), tipo:String) {
        Alamofire.request(.GET, "https://celularregistradows.herokuapp.com/cad_celular/qrcode/"+tipo, headers:headers)
            .responseJSON { _,  _, response in
                let json:JSON = JSON(response.value!)
                completionHandler(responseObject: json)
        }
    }






}