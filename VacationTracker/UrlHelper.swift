import Foundation

func getBaseUrl(caller: AnyObject, baseUrlKey: String = "base_url") -> String {

  if let baseUrl = NSUserDefaults.standardUserDefaults().stringForKey(baseUrlKey) {
    if !baseUrl.isEmpty {
      return "\(baseUrl)/"
    }
  }

  let infoPlist = NSDictionary(contentsOfFile: NSBundle(forClass: caller.dynamicType).pathForResource("Info", ofType: "plist")!)

  if let baseUrl = infoPlist?.objectForKey(baseUrlKey) as? String {
    if !baseUrl.isEmpty {
      return "\(baseUrl)/"
    }
  }

  return "http://vacationtracker.herokuapp.com/"
}
