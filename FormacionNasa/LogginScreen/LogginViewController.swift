//
//  LogginViewController.swift
//  FormacionNasa
//
//  Created by Ruben Higueras Galan on 15/10/2020.
//  Copyright © 2020 Ruben Higueras Galan. All rights reserved.
//

import UIKit

class LogginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTexts()
        setStyles()
        // Do any additional setup after loading the view.
    }
    
    func setTexts(){
        
    }
    
    func setStyles(){
        
    }
    
    @IBAction func registerAction(_ sender: Any) {
    }
    
    @IBAction func logginAction(_ sender: Any) {
//        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let nasaListViewController = storyBoard.instantiateViewController(withIdentifier: "nasaListViewController") as! NasaListViewController
//        nasaListViewController.modalPresentationStyle = .fullScreen
//        present(nasaListViewController, animated: true, completion: nil)
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
