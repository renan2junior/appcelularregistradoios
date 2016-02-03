//
//  ParseModels.swift
//  tvines-swift-ios
//
//  Created by hannahlisboa on 05/11/15.
//  Copyright © 2015 hannahlisboa. All rights reserved.
//

import Foundation
import SwiftyJSON
class ParseModels {
    
    func parseCelular(json:JSON)->Celular{
        let celular:Celular = Celular()
        
        celular.alerta_celular = json["alerta_celular"].stringValue
        celular.imei_celular = json["imei_celular"].stringValue
        celular.nome_operadora = json["nome_operadora"].stringValue
        celular.nome_modelo = json["nome_modelo"].stringValue
        celular.nome_usuario = json["nome_usuario"].stringValue
        celular.imagem_usuario = json["imagem_usuario"].stringValue
        celular.nome_fabricante = json["nome_fabricante"].stringValue
        celular.email_usuario = json["email_usuario"].stringValue

        
        
        return celular
    }
}
