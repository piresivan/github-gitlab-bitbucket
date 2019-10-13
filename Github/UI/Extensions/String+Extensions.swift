import Foundation

extension String {
    static func toString(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateFormatter.date(from: date)
        
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let dateStr = dateFormatter.string(from: d!)
        return dateStr
    }
}
