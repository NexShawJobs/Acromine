//
//  ViewController.swift
//  Acromine
//
//  Created by NebSha on 10/26/21.
//

import UIKit

class AcromineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var acromineTxtField: UITextField!
    @IBOutlet weak var acromineMeaningTableView: UITableView!
    var acromineViewModel:AcromineViewModel = AcromineViewModel()
    var acromineResponses:[Lf] = []
    //var acromineMeanings = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.acromineMeaningTableView.register(UITableViewCell.self,
         forCellReuseIdentifier: "cell")
        acromineMeaningTableView.delegate = self
        acromineMeaningTableView.dataSource = self
    }

    @IBAction func getAcromineMeaning(_ sender: Any) {
        if let ac = acromineTxtField.text {
            self.acromineResponses =  self.getAc(for: ac)
        }
    }
    
    func getAc(for ac:String ) -> [Lf] {
            acromineViewModel.fetchAcromineData(for: self.acromineViewModel.stringUrlAcromineData(forAcromine: ac), completion: {
                do{
                    let response = try JSONDecoder().decode([AcromineResponse].self, from: self.acromineViewModel.acromineData)
                    if response.count > 0{
                        self.acromineResponses = response[0].lfs!
                    }
                    DispatchQueue.main.async {
                        self.acromineMeaningTableView.reloadData()
                    }
                }catch let err {
                    print(err)
                    //log error and notify user if needed 
                }
            })
        return self.acromineResponses
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.acromineResponses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.acromineMeaningTableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = self.acromineResponses[indexPath.row].lf
        return cell

    }
}

