//
//  ViewController.swift
//  CurrencyConverteriOS
//
//  Created by Krishna Prakash on 30/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var inrLabel: UILabel!
    @IBOutlet weak var kwdLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func GetRatesBtn(_ sender: Any) {
        // 1. Request & Session
        // 2. Response & Data
        // 3. Parsing & JSON Serialization
        
        
        //1)
        let url = URL(string: "https://api.apilayer.com/fixer/latest?apikey=AA12QVx9HSFQjYpC5gqfp4uh8j46gTtN")
        
        let session = URLSession.shared
        
        //closure
        
        let task = session.dataTask(with: url!) {(data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription,  preferredStyle: UIAlertController.Style.alert)
                let okbutton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
            }else {
                //2)
                if data != nil {
                    do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        //Async
                        DispatchQueue.main.async {
                            print(jsonResponse)
                        }
                        
                        
                    } catch {
                        print("Error")
                    }
                }
            }
            
        }
        task.resume()
        
        
        
    }
    
}
