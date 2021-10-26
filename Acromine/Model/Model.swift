//
//  Model.swift
//  Acromine
//
//  Created by NebSha on 10/26/21.
//

import Foundation

struct AcromineResponse : Decodable {
        let sf:String?
        let lfs: [Lf]?
    
    init (sf:String? = nil, lfs:[Lf]? = nil){
        self.sf = sf
        self.lfs = lfs
    }
}

struct Lf : Decodable {
    let lf:String?
    let freq:Int?
    let since:Int
}

class Services: NSObject {
        static let baseURL =
            "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf="
        func fetcAcromineData(for strUrl:String, completion:@escaping (Data) -> ())  {
            guard let url = URL(string: strUrl) else { return }
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                guard let data = data else {
                    return
                }
                if let err = err {
                    print(err)
                    //handle response error
                }
                    completion(data)
                    return
                }.resume()
        }

        func stringUrlForAcromineData(forAcromine acromine:String) -> String{
            return Services.baseURL + acromine
        }
    }
