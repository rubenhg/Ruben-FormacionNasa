//
//  LogginViewController.swift
//  FormacionNasa
//
//  Created by Ruben Higueras Galan on 15/10/2020.
//  Copyright © 2020 Ruben Higueras Galan. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTexts()
        
        // Do any additional setup after loading the view.
    }
    
    func setTexts(){
        emailTextField.placeholder = "Email Address"
        passwordTextField.placeholder = "Password"
        registerButton.setTitle("Sign Up", for: .normal)
        logginButton.setTitle("Sign In", for: .normal)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if let email = emailTextField.text , let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (completion, error) in
                
                if  error == nil{
                    let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let tabBarController = storyBoard.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
                    tabBarController.modalPresentationStyle = .fullScreen
                    self.present(tabBarController, animated: true, completion: nil)
                    
                }else{
                    let alert = UIAlertController(title: "Error", message: "Se ha producido un error en el registro de usuario. Compruebe que los datos introducidos sean correctos", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cerrar", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func logginAction(_ sender: Any) {
        if let email = emailTextField.text , let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (completion, error) in
                
                if  error == nil{
                   let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let tabBarController = storyBoard.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
                    tabBarController.modalPresentationStyle = .fullScreen
                    self.present(tabBarController, animated: true, completion: nil)
                    
                }else{
                    let alert = UIAlertController(title: "Error", message: "Se ha producido un error en el inicio de sesion.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cerrar", style: .default))
                    self.present(alert, animated: true, completion: nil)
                    }
                }
            }
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
