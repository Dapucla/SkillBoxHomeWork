//
//  RealmWeatherForcastTableViewCell.swift
//  DataStoringPractise
//
//  Created by Даниил Алексеев on 10.12.2020.
//

import UIKit

class RealmWeatherForcastTableViewCell: UITableViewCell {
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
        setForecastTemperatureLabel()
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
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        weatherIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
        weatherIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        weatherIcon.heightAnchor.constraint(equalToConstant: 40),
        weatherIcon.widthAnchor.constraint(equalTo: weatherIcon.heightAnchor)
        ])
    }
    
    func setDateLabeConstraintsl(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateLabel.heightAnchor.constraint(equalToConstant: 40),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    func setForecastTemperatureLabel() {
        forecastTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        forecastTemperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        forecastTemperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
        forecastTemperatureLabel.heightAnchor.constraint(equalToConstant: 40),
        forecastTemperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }

}
