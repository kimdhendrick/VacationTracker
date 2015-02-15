import Foundation

class OverviewService {

  func getOverview(completion: (overview: Overview!) -> ()) {

    var overviewRequest = OverviewRequest.init()
    let queue = NSOperationQueue()

    NSURLConnection.sendAsynchronousRequest(overviewRequest.request, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
      if let httpResponse = response as? NSHTTPURLResponse {
        if httpResponse.statusCode != 200 {
          println("Error getting overview: \(httpResponse.statusCode)")
        } else if error != nil {
          println("Error getting overview: \(error)")
        } else {
          OverviewResponseHandler.init().processResponse(data, completion)
        }
      } else {
        println("Error getting overview: unknown")
      }
    })
  }
}