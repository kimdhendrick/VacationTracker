import Foundation

class LoginResponse {
  var success: Bool = false
  var message: String = ""

  var authenticityToken: String?

  let ErrorWhenResponseNotJson: String = "Error contacting server"
  let ErrorWhenResponseEmpty: String = "Unknown server error"
  let SuccessStatus = 200

  init(dataResponse: NSData?, response: NSURLResponse?, error: NSError?) {

    if let httpResponse = response as? NSHTTPURLResponse {

      if httpResponse.statusCode != SuccessStatus {
        handleFailureWithMessage(NSHTTPURLResponse.localizedStringForStatusCode(httpResponse.statusCode))
        return
      }

      if (dataResponse == nil) {
        handleFailureWithMessage(error?.localizedDescription ?? ErrorWhenResponseEmpty)
        println("dataResponse: \(dataResponse); response: \(response); error: \(error?.localizedDescription)")
        return
      }

      var parseError: NSError?
      if let json = NSJSONSerialization.JSONObjectWithData(dataResponse!, options: nil, error: &parseError) as? NSDictionary {
        let jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(
          dataResponse!,
          options: NSJSONReadingOptions.MutableContainers,
          error: &parseError) as NSDictionary
        success = true
        authenticityToken = jsonResult["auth_token"] as String?
      } else {
        handleFailureWithMessage(ErrorWhenResponseNotJson)
      }
    } else {
      handleFailureWithMessage(ErrorWhenResponseNotJson)
    }
  }

  private func handleFailureWithMessage(failureMessage: String) {
    success = false
    message = failureMessage
  }
}
