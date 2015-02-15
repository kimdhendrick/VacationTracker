import Foundation

class LoginService {

  func logIntoVacationTrackerWith(email: String, password: String) -> (success: Bool, message: String) {

    let loginRequest = LoginRequest.init(email: email, password: password)

    var response: NSURLResponse?
    var error: NSError?
    let dataResponse = NSURLConnection.sendSynchronousRequest(
      loginRequest.request,
      returningResponse: &response,
      error: &error
    )

    var loginResponse = LoginResponse.init(dataResponse: dataResponse, response: response, error: error)

    if (loginResponse.success) {
      let prefs = getDefaultPrefs()
      prefs.setObject(email, forKey: "EMAIL")
      prefs.setObject(loginResponse.authenticityToken, forKey: "AUTHENTICITY_TOKEN")
      prefs.setInteger(1, forKey: "ISLOGGEDIN")
      prefs.synchronize()
    }

    return (loginResponse.success, loginResponse.message)
  }
}