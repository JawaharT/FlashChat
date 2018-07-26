//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login

import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func logInPressed(_ sender: AnyObject) {
        //TODO: Log in the user
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil{
                print(error!)
                SVProgressHUD.dismiss()
                let alert = UIAlertController(title: "Error in signing in. \(error!)", message: "Please Try Again", preferredStyle: .alert)
                let yesAction = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in }
                alert.addAction(yesAction)
                self.present(alert, animated: true, completion: nil)
            }else{
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
}  
