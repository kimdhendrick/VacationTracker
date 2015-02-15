import UIKit

class OverviewViewController: UIViewController {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var hiredOnLabel: UILabel!
  @IBOutlet weak var asOfLabel: UILabel!
  @IBOutlet weak var ptoHoursUsedLabel: UILabel!
  @IBOutlet weak var ptoHoursAccruedLabel: UILabel!
  @IBOutlet weak var ptoHoursAvailableLabel: UILabel!

  var overview: Overview = Overview()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.nameLabel.text = userEmail()
  }

  func loadOverview(overview: Overview?) {
    dispatch_async(dispatch_get_main_queue(), { () -> Void in
      if let overview = overview {
        self.overview = overview
        self.hiredOnLabel.text = overview.hiredOn
        self.asOfLabel.text = overview.asOf
        self.ptoHoursUsedLabel.text = overview.ptoHoursUsed
        self.ptoHoursAccruedLabel.text = overview.ptoHoursAccrued
        self.ptoHoursAvailableLabel.text = overview.ptoHoursAvailable
        self.view.setNeedsDisplay()
      }
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

