//
//  Store.swift
//  Class03
//
//  Created by L20102 on 2019/6/3.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import Foundation


class Store {
    
    // 類別代號
    var ServiceIndex : Int = 0
    // 名稱
    var Name : String?
    // 商店地理位置
    var StoreLocation : LocationDesc?
    // 商店代號
    var Index : Int = 0
    // 影像位置
    var ImagePath : String?
    
}

class LocationDesc {
    /// 地址
    var Address : String?
    /// 緯度
    var Latitude : Double?
    /// 經度
    var Longitude : Double?
}
