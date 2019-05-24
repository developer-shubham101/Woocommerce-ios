//
//  AttributesModel.swift
//  Woocommerce
//
//  Created by Amit Shukla on 10/03/18.
//  Copyright © 2018 Amit Shukla. All rights reserved.
//

import Foundation
import SwiftyJSON

class AttributesModel {
    public var options:[JSON]?
    public var id:Int?
    public var name:String?
    public var position:Int?
    public var visible:Bool?
    public var variation:Bool?
    
    init(options: [JSON], id:Int, name:String, position:Int, visible:Bool, variation:Bool) {
        self.id = id
        self.name = name
        self.position = position
        self.visible = visible
        self.variation = variation
    }
    
}
