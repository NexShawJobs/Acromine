//
//  AcromineViewMoel.swift
//  Acromine
//
//  Created by NebSha on 10/26/21.
//

import Foundation

class AcromineViewModel {
    var services = Services()
    var acromineData:Data = Data()
    
    func fetchAcromineData(for urlString:String, completion:@escaping () -> ()){
        services.fetcAcromineData(for: urlString, completion: {data in
            self.acromineData = data
            completion()
        })
    }
    func stringUrlAcromineData(forAcromine acromine:String) -> String{
        return services.stringUrlForAcromineData(forAcromine: acromine)
    }
}
