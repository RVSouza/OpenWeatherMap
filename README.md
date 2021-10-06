## Dependencies 

* Ruby 2.7 installed (https://rubyinstaller.org/downloads/)
* Node.js installed
* Java 8 or greater

## Installation

* Clone the repository
* Access the cloned repository with cmd/terminal
* Install bundler gem ```gem install bundler```
* Run the bundler gem to install the project dependecies ```bundle```

## Execution

* Run all scenarios using cucumber ```cucumber```
* Run all scenarios using rake ```rake```

* Run all scenarios from check weather feature using cucumber ```cucumber -t @check_weather```
* Run all scenarios from check weather feature using rake ```rake check_weather```

* Run scenarios with the tag using cucumber ```cucumber -t @tag```
* Run check weather scenarios using rake ```rake run_tag```

## Report

* Verify cucumber report ```rake cucumber_report```
* Verify allure report ```rake check_weather``` or ```allure serve report/allure-results```


