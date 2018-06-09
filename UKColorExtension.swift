

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat=1) {
        let red     = CGFloat((hex & 0xFF0000) >> 16) / 0xFF
        let green   = CGFloat((hex & 0x00FF00) >> 8) / 0xFF
        let blue    = CGFloat(hex & 0x0000FF) / 0xFF
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    var light: UIColor {
        let cmpnts = self.components
        return UIColor(red: cmpnts[0]+(1-cmpnts[0])/2,
                       green: cmpnts[1]+(1-cmpnts[1])/2,
                       blue: cmpnts[2]+(1-cmpnts[2])/2,
                       alpha: cmpnts[3])
    }
    
    var dark: UIColor {
        let cmpnts = self.components
        return UIColor(red: cmpnts[0]/2,
                       green: cmpnts[1]/2,
                       blue: cmpnts[2]/2,
                       alpha: cmpnts[3])
    }
    
    private var components: [CGFloat] {
        let cmpnt = self.cgColor.components
        return cmpnt.unwrappedCount == 4 ? cmpnt! : [0,0,0,1]
    }
}

