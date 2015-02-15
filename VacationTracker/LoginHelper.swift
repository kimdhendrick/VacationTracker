import Foundation

func isLoggedIn() -> Bool {
  let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
  return prefs.boolForKey("ISLOGGEDIN")
}

