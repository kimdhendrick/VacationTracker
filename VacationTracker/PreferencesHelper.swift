import Foundation

func getDefaultPrefs() -> NSUserDefaults {
  let prefs: NSUserDefaults = NSUserDefaults.standardUserDefaults()
  prefs.setObject("", forKey: "FIRST_NAME")
  prefs.setObject("", forKey: "AUTHENTICITY_TOKEN")
  prefs.setInteger(0, forKey: "ISLOGGEDIN")
  prefs.synchronize()
  return prefs
}

