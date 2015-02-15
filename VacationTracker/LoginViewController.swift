import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  @IBAction func loginButtonPressed(sender: UIButton) {
    handleLoginButtonPressed()
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    if textField == emailTextField {
      passwordTextField.becomeFirstResponder()
    } else if textField == passwordTextField {
      handleLoginButtonPressed()
    }
    return false
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  private func handleLoginButtonPressed() {
    let (success, message) = LoginService().logIntoVacationTrackerWith(emailTextField.text, password: passwordTextField.text)

    if success {
      self.performSegueWithIdentifier("gotoHomeView", sender: self)
    } else {
      loginFailed(message)
    }
  }

  private func loginFailed(reason: String) {
    let alert = UIAlertController(title: "Login Failed", message: reason, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }
}
