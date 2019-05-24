//
//  Categories.swift
//  Woocommerce
//
//  Created by Amit Shukla on 10/03/18.
//  Copyright © 2018 Amit Shukla. All rights reserved.
//

import UIKit

class Categories {
    public var id:Int? = nil
    public var name:String = ""
    public var slug:String = ""

    init(id:Int, name:String, slug:String) {
        self.id = id
        self.name = name
        self.slug = slug
    }

}
