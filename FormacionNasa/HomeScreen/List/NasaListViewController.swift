//
//  NasaListViewController.swift
//  FormacionNasa
//
//  Created by Ruben Higueras Galan on 15/10/2020.
//  Copyright © 2020 Ruben Higueras Galan. All rights reserved.
//

import UIKit

class NasaListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let items = ["Item 1", "Item2", "Item3", "Item4"]
    var nasaDictionary = [String: [String]]()
    
    struct Class: Decodable {
           let date: String
           let title: String
           let image: String
           enum CodingKeys : String, CodingKey {
               case date = "date"
               case title = "title"
               case image = "hdurl"
           }
       }

    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(date: "2020-10-22")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(UINib(nibName: "NasaTableViewCell", bundle: nil), forCellReuseIdentifier: "nasaTableViewCell")
        //imageView.image = UIImage(url: URL(string: "some_url.png"))
        
        }
    
    
    func setData(date: String){
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=XinaivKeLDrbocichMnd545VMmHJw7ByWSefDESQ&date=\(date)")

            URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
                guard let data = data, error == nil else { print(error!); return }
                
                let decoder = JSONDecoder()
                let classes = try! decoder.decode(Class.self, from: data)
                
                if self.nasaDictionary["date"] != nil && self.nasaDictionary["title"] != nil && self.nasaDictionary["image"] != nil {
                    self.nasaDictionary["date"]!.append(classes.date)
                    self.nasaDictionary["title"]!.append(classes.title)
                    self.nasaDictionary["image"]!.append(classes.image)
                } else {
                    self.nasaDictionary["date"] = [classes.date]
                    self.nasaDictionary["title"] = [classes.title]
                    self.nasaDictionary["image"] = [classes.image]
                }
                
                for (key, value) in self.nasaDictionary {
                    print("\(key) : \(value)")
                }
                
            }).resume()
            
            }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nasaTableViewCell", for: indexPath) as! NasaTableViewCell
        if let title = nasaDictionary["title"], let date = nasaDictionary["date"], let image = nasaDictionary["image"]
        {
            cell.titleLabel.text = title.first
            cell.dateLabel.text = date.first
            cell.imageV.image = UIImage(url: URL(string: image.first!))
        }
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
