import Foundation

class OverviewResponseHandler {
  func processResponse(data: NSData!, completion: (overview: Overview!) -> ()) -> Void {

    var error: NSError?
    let jsonResults = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as Dictionary<String, AnyObject>

    let overviewResult = Overview.init(jsonOverview: jsonResults)

    completion(overview: overviewResult)
  }
}
