import Foundation

func isLoggedIn() -> Bool {
  let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
  return prefs.boolForKey("ISLOGGEDIN")
}

func userEmail() -> String {
  let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
  return prefs.stringForKey("EMAIL")!
}

