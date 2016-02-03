//
//  GlobalVariables.swift
//  tvines-swift-ios
//
//  Created by hannahlisboa on 05/11/15.
//  Copyright © 2015 hannahlisboa. All rights reserved.
//

import Foundation
import UIKit

class GlobalVariables {
    
    static let sharedInstance = GlobalVariables()

    let WS_BASE_URL : String = "https://celularregistradows.herokuapp.com"
    let WS_RECUPERAR_QRCODE: String = "/cad_celular/qrcode/"
    let WS_RECUPERAR_TAG: String = "/cad_celular/tag/"
    let WS_RECUPERAR_IMEI:String = "/cad_celular/imei/"
    
    let TITULO_ALERT: String = "TV INES"
    let TITULO_ALERT_ERROR: String = "OPS!"
    let MSG_ERROR: String  = "Ocorreu um problema. Verifique sua conexão e tente mais novamente."

    let FONT_MISO_TITLE = UIFont(name: "Miso-Light", size:25)!
    let FONT_JOSEFIN_TITLE = UIFont(name: "JosefinSans-Light", size:20)
    let FONT_JOSEFIN_BODY = UIFont(name: "JosefinSans-Thin", size:16)
    
   
}
