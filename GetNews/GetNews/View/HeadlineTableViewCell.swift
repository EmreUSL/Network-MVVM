//
//  HeaderTableViewCell.swift
//  GetNews
//
//  Created by emre usul on 16.01.2023.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {
    
    static let identifier = "HeadlineTableViewCell"
    
    //MARK: - Views
    
    private let titlelabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 3
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    public func configureCell(news:String , description:String) {
        titlelabel.text = news
        descriptionLabel.text = description
    }
    
    
    //MARK: -  Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        subview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titlelabel.frame = CGRect(x: 15, y: 15, width: 360, height: 70)
        descriptionLabel.frame = CGRect(x: 15, y: 95, width: 370, height: 80)
        
    }
    
    //MARK: - Subviews
    private func subview() {
        addSubview(titlelabel)
        addSubview(descriptionLabel)
    }
}
