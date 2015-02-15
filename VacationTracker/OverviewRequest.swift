import Foundation

class OverviewRequest {

  var request: NSMutableURLRequest = NSMutableURLRequest()

  let OverviewUrl: String = "api/v1/overview"

  init() {

    let url = NSURL(string: "\(getBaseUrl(self))\(OverviewUrl)")
    request = NSMutableURLRequest(URL: url!)

    let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let email = prefs.stringForKey("EMAIL")!
    let authToken = prefs.stringForKey("AUTHENTICITY_TOKEN")!

    request.addValue(email, forHTTPHeaderField: "X-User-Email")
    request.addValue(authToken, forHTTPHeaderField: "X-User-Token")
  }
}
