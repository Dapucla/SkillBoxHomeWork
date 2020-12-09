import UIKit
import Alamofire

class WeatherViewController: UIViewController {
    // MARK: - Задаем необходимые переменные
    let gradientLayer = CAGradientLayer()
    let tableView = UITableView()
    var weatherService: WeatherService?
    var forcastWeatherDataArray = [List]()
    let cityNameLabel = UILabel()
    let currentWeatherDescriptionLabel = UILabel()
    let currentWeatherImageView = UIImageView()
    let currentWeatherTemperatureLabel = UILabel()
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView().layer.addSublayer(gradientLayer)
        cityNameLabel(nameLabel: cityNameLabel)
        currentWeatherDescriptionLabel(descriptionLabel: currentWeatherDescriptionLabel)
        currentWeatherImageView(weatherImage: currentWeatherImageView)
        currentWeatherTemperatureLabel(currentTemp: currentWeatherTemperatureLabel)
        configureTableView()
        weatherService?.currentWeather{ currentWeather in
            self.cityNameLabel.text = currentWeather.name
            self.currentWeatherDescriptionLabel.text = currentWeather.weather[0].description
            self.currentWeatherImageView.image = UIImage(named: "\(currentWeather.weather[0].icon)")
            self.currentWeatherTemperatureLabel.text = "\(currentWeather.main.temp.rounded())"
        }
        weatherService?.forecastWeather{ forecastWeather in
            self.forcastWeatherDataArray = forecastWeather.list
            self.tableView.reloadData()
        }
    }
    // MARK: - Вызываем ViewWillAppear для создания градиента
    override func viewWillAppear(_ animated: Bool) {
        gradientBackground()
    }
    // MARK: - Создаем градиент
    func gradientBackground(){
        let topColor = UIColor.systemYellow.cgColor
        let bottomColor = UIColor.systemOrange.cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
    }
    // MARK: - Создаем backgroundView, который будем использовать для градиента и располагать все элементы UI
    func backgroundView() -> UIView{
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.red
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        return backgroundView
    }
    // MARK: - Создаем label, для названия города
    func cityNameLabel(nameLabel: UILabel){
        nameLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        nameLabel.center = CGPoint(x: 160, y: 60)
        nameLabel.textAlignment = .center
        nameLabel.center.x = self.view.center.x
        nameLabel.font = UIFont(name:"DIN Condensed", size: 60.0)
        view.addSubview(nameLabel)
    }
    // MARK: - Создаем label, для состояние текущей погоды
    func currentWeatherDescriptionLabel(descriptionLabel: UILabel){
        descriptionLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
        descriptionLabel.center = CGPoint(x: 160, y: 90)
        descriptionLabel.textAlignment = .center
        descriptionLabel.center.x = self.view.center.x
        descriptionLabel.font = UIFont(name:"DIN Condensed", size: 20.0)
        view.addSubview(descriptionLabel)
    }
    // MARK: - Создаем UIImageView, для иконки текущей погоды
    func currentWeatherImageView(weatherImage: UIImageView){
        weatherImage.frame = CGRect(x: 0, y: 0, width: 170, height: 170)
        weatherImage.center = CGPoint(x: 160, y: 180)
        weatherImage.center.x = self.view.center.x
        view.addSubview(weatherImage)
    }
    // MARK: - Создаем label, для текущей температуры
    func currentWeatherTemperatureLabel(currentTemp: UILabel){
        currentTemp.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        currentTemp.center = CGPoint(x: 160, y: 310)
        currentTemp.textAlignment = .center
        currentTemp.center.x = self.view.center.x
        currentTemp.font = UIFont(name:"DIN Condensed", size: 80.0)
        view.addSubview(currentTemp)
    }
    // MARK: - Создаем tableView с прогнозом погоды
    func configureTableView(){
        setTableViewDelegates()
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: currentWeatherTemperatureLabel.topAnchor, constant: 100.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.backgroundColor = UIColor.clear
    }
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcastWeatherDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! ForecastTableViewCell
        cell.dateLabel.text = "\(self.forcastWeatherDataArray[indexPath.row].dt_txt)"
        cell.forecastTemperatureLabel.text = ("\(self.forcastWeatherDataArray[indexPath.row].main.temp.rounded())")
        cell.weatherIcon.image = UIImage(named: "\(self.forcastWeatherDataArray[indexPath.row].weather[0].icon)")
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}



