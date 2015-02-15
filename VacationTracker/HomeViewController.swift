import UIKit

class HomeViewController: UITabBarController {

  let overviewTabTag = 0
  let requestsTabTag = 1

  override func viewDidLoad() {
    super.viewDidLoad()

    OverviewService.init().getOverview() { (overview: Overview!) -> () in
      if let overviewController = self.viewControllers![self.overviewTabTag] as? OverviewViewController {
        overviewController.loadOverview(overview)
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
