import UIKit
import Alamofire

class WeatherViewController: UIViewController {
    // MARK: - Задаем необходимые переменные
    let gradientLayer = CAGradientLayer()
    let tableView = UITableView()
    var weatherService: WeatherService?
    var forcastWeatherDataArray = [List]()
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView().layer.addSublayer(gradientLayer)
        cityNameLabel()
        currentWeatherDescriptionLabel()
        currentWeatherImageView()
        configureTableView()
        
        weatherService?.forecastWeather{ forecastWeather in
            self.forcastWeatherDataArray = forecastWeather.list
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
    func cityNameLabel(){
        let cityNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        cityNameLabel.center = CGPoint(x: 160, y: 60)
        cityNameLabel.textAlignment = .center
        cityNameLabel.center.x = self.view.center.x
        cityNameLabel.font = UIFont(name:"DIN Condensed", size: 60.0)
        weatherService?.currentWeather { currentWeather in
            cityNameLabel.text = currentWeather.name
        }
        view.addSubview(cityNameLabel)
    }
    // MARK: - Создаем label, для состояние текущей погоды
    func currentWeatherDescriptionLabel(){
        let currentWeatherDescriptionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        currentWeatherDescriptionLabel.center = CGPoint(x: 160, y: 90)
        currentWeatherDescriptionLabel.textAlignment = .center
        currentWeatherDescriptionLabel.center.x = self.view.center.x
        currentWeatherDescriptionLabel.font = UIFont(name:"DIN Condensed", size: 20.0)
        weatherService?.currentWeather { currentWeather in
            currentWeatherDescriptionLabel.text = currentWeather.weather[0].description
        }
        view.addSubview(currentWeatherDescriptionLabel)
    }
    // MARK: - Создаем UIImageView, для иконки текущей погоды
    func currentWeatherImageView(){
        let currentWeatherImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 170, height: 170))
        currentWeatherImageView.center = CGPoint(x: 160, y: 180)
        currentWeatherImageView.center.x = self.view.center.x
        weatherService?.currentWeather { currentWeather in
            currentWeatherImageView.image = UIImage(named: "\(currentWeather.weather[0].icon)")
        }
        view.addSubview(currentWeatherImageView)
    }
    // MARK: - Создаем label, для текущей температуры
    func currentWeatherTemperatureLabel() -> UILabel{
        let currentWeatherTemperatureLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
        currentWeatherTemperatureLabel.center = CGPoint(x: 160, y: 310)
        currentWeatherTemperatureLabel.textAlignment = .center
        currentWeatherTemperatureLabel.center.x = self.view.center.x
        currentWeatherTemperatureLabel.font = UIFont(name:"DIN Condensed", size: 80.0)
        weatherService?.currentWeather { currentWeather in
            self.tableView.reloadData()
            currentWeatherTemperatureLabel.text = "\(currentWeather.main.temp.rounded())°C"
        }
        view.addSubview(currentWeatherTemperatureLabel)
        return currentWeatherTemperatureLabel
    }
    // MARK: - Создаем tableView с прогнозом погоды
    func configureTableView(){
        setTableViewDelegates()
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: currentWeatherTemperatureLabel().topAnchor, constant: 100.0).isActive = true
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
        weatherService?.forecastWeather { forecastWeather in
            cell.dateLabel.text = "\(self.forcastWeatherDataArray[indexPath.row].dt_txt)"
            cell.forecastTemperatureLabel.text = ("\(self.forcastWeatherDataArray[indexPath.row].main.temp.rounded())")
            cell.weatherIcon.image = UIImage(named: "\(self.forcastWeatherDataArray[indexPath.row].weather[0].icon)")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}

