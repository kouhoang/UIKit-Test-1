//
//  ViewController.swift
//  UI1_demo
//
//  Created by admin on 19/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var smallCircleView: UIView!
    @IBOutlet weak var mainCircleView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bigCircleView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starNumberLabel: UILabel!
    @IBOutlet weak var medalNumberLabel: UILabel!
    @IBOutlet weak var cloudXEmoji: UIImageView!
    
    var isToggled = false
    var originalStates: [(label: UILabel, frame: CGRect, text: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainView.layer.cornerRadius = 5
        
        myButton.layer.cornerRadius = 5
        
        smallCircleView.layer.cornerRadius = smallCircleView.frame.width/2
        smallCircleView.backgroundColor = .red
        smallCircleView.clipsToBounds = true
        smallCircleView.backgroundColor = UIColor(red: 252/255, green: 85/255, blue: 92/255, alpha: 1.0)
        
        bigCircleView.layer.cornerRadius = bigCircleView.frame.width/2
        bigCircleView.backgroundColor = .red
        bigCircleView.clipsToBounds = true
        bigCircleView.backgroundColor = UIColor(red: 252/255, green: 85/255, blue: 92/255, alpha: 1.0)
        
        applyBlurEffect(to: circleView)
        applyBlurEffect(to: mainCircleView)
    
        setCurrentDate()
        
        addressLabel.text = "Cau Giay, Ha Noi City"
        addressLabel.font = UIFont(name: "Georgia", size: 13)
        
        nameLabel.font = UIFont(name:"Georgia-Bold", size: 16.0)
        starNumberLabel.font = UIFont(name: "Georgia", size: 16)
        medalNumberLabel.font = UIFont(name: "Georgia", size: 16)
        
        saveOriginalState(for: [nameLabel, starNumberLabel, medalNumberLabel])
        
        myButton.setTitle("Ultimate 🌟", for: .normal)
        myButton.titleLabel?.font = UIFont(name: "Georgia", size: 20)
        myButton.addTarget(self, action: #selector(toggleLabels), for: .touchUpInside)
        
        let emojiImage = UIImage(named: "Iconsmind-Outline-Cloud-Remove.512.png")?.withRenderingMode(.alwaysTemplate)
        cloudXEmoji.image = emojiImage
        cloudXEmoji.tintColor = UIColor(red: 252/255, green: 85/255, blue: 92/255, alpha: 1.0)
    }
    
    func applyBlurEffect(to view: UIView) {
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        let halfHeight = view.bounds.height / 2
        blurView.frame = CGRect(x: 0, y: halfHeight, width: view.bounds.width, height: halfHeight)
        
        view.addSubview(blurView)
    }
    
    func setCurrentDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d yyyy" // Fri, Mar 22 2019
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let currentDate = Date()
        let dateString = dateFormatter.string(from: currentDate)
        
        // Get current date
        let calendar = Calendar.current
        let day = calendar.component(.day, from: currentDate)
        
        // Add "st", "nd", "rd", "th" to the day
        let dayWithSuffix = "\(day)\(daySuffix(from: day))"
        let formattedDate = dateString.replacingOccurrences(of: "\(day)", with: dayWithSuffix)
        
        dateLabel.text = formattedDate
        dateLabel.font = UIFont(name: "Georgia", size: 13)
    }
    
    func daySuffix(from day: Int) -> String {
        switch day {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }
    
    func saveOriginalState(for labels: [UILabel]) {         originalStates = labels.map { ($0, $0.frame, $0.text ?? "") }
    }
    
    @objc func toggleLabels() {
        if isToggled {
            restoreOriginalState()
        }
        else {
            updateLabels()
        }
        isToggled.toggle()
    }
    
    func restoreOriginalState() {
        for state in originalStates {
            state.label.frame = state.frame
            state.label.text = state.text
        }
    }
    
    func updateLabels() {
        nameLabel.text = "nmint888888888888"
        
        starNumberLabel.text = "⭐ 999.999"
        starNumberLabel.frame.origin.x -= 80
        starNumberLabel.frame.size.width += 50
        
        medalNumberLabel.text = "🥇 999.999"
        medalNumberLabel.frame.origin.x -= 50
        medalNumberLabel.frame.size.width += 50
    }
    
}

