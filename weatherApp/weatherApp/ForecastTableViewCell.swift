//
//  ForecastCellTableViewCell.swift
//  Pods
//
//  Created by Даниил Алексеев on 29.11.2020.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    var weatherIcon = UIImageView()
    var dateLabel = UILabel()
    var forecastTemperatureLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(weatherIcon)
        addSubview(dateLabel)
        addSubview(forecastTemperatureLabel)
        
        configureImage()
        configureDateLabel()
        configureForecastTemperatureLabel()
        setImageConstraints()
        setDateLabeConstraintsl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage() {
        weatherIcon.layer.cornerRadius = 10
        weatherIcon.clipsToBounds = true
    }
    
    func configureDateLabel(){
        dateLabel.numberOfLines = 0
        dateLabel.adjustsFontSizeToFitWidth = true
    }
    func configureForecastTemperatureLabel(){
        forecastTemperatureLabel.numberOfLines = 0
        forecastTemperatureLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints(){
        NSLayoutConstraint.activate([
            weatherIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            weatherIcon.heightAnchor.constraint(equalToConstant: 40),
            weatherIcon.widthAnchor.constraint(equalTo: weatherIcon.heightAnchor)
        ])
    }
    
    func setDateLabeConstraintsl(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}
