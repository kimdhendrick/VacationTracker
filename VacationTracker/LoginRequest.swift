import Foundation

class LoginRequest {

  var request: NSMutableURLRequest = NSMutableURLRequest()

  let VacationTrackerLoginUrl: String = "api/v1/auth/sign_in"

  init(email: String, password: String) {

    let url = NSURL(string: "\(getBaseUrl(self))\(VacationTrackerLoginUrl)")
    let loginRequest = NSMutableURLRequest(URL: url!)
    loginRequest.HTTPMethod = "POST"

    let params = [
      "email": "\(email)",
      "password": "\(password)"
      ] as Dictionary<String, String>

    var error: NSError?
    loginRequest.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &error)
    loginRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    loginRequest.addValue("application/json", forHTTPHeaderField: "Accept")

    request = loginRequest
    
  }
}
