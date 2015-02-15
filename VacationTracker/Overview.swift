import Foundation

class Overview {
  var email: String = ""
  var hiredOn: String = ""
  var ptoHoursUsed: String = ""
  var ptoHoursAccrued: String = ""
  var ptoHoursAvailable: String = ""
  var asOf: String = ""

  init() {}

  init(jsonOverview: NSDictionary) {
    self.email = jsonOverview["email"] as String
    self.hiredOn = jsonOverview["hired_on"] as String
    self.ptoHoursUsed = jsonOverview["pto_hours_used"] as String
    self.ptoHoursAccrued = jsonOverview["pto_hours_accrued"] as String
    self.ptoHoursAvailable = jsonOverview["pto_hours_available"] as String
    self.asOf = jsonOverview["as_of"] as String
  }
}
