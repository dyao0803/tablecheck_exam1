# README
TableCheck Exam

## Local Installation
### Requirements
- Ruby 3.2.2
- Rails 7.1.3
- Bundler
- openweather api key (https://openweathermap.org/)
---
### Installation instructions
> assuming ruby has been installed correctly

```
> bundle install
> rails db:create db:migrate
```

### Environment and YAML instructions
- Fill in necessary info for each yaml/env/key file
```
cp .env.sample .env
cp config/cable.yml.sample config/cable.yml
cp config/credentials.yml.enc.sample config/credentials.yml.enc
cp config/database.yml.sample config/database.yml
cp config/master.key.sample config/master.key
cp config/storage.yml.sample config/storage.yml
```

---
### Run on server
`rails s`

---
## [ENDPOINT DOCUMENTATION LINK](https://github.com/dyao0803/tablecheck_exam1/blob/main/README_ENDPOINT.md)

## Future Development
to accommodate larger audiences, the following features should be considered
- storage of location parameters for lat/long
> when a location is requested, its lat/long should be stored in a database so that we don't have to check the lat/long of the location through webservice. This allows for faster request/response time
- some form of caching should be considered, to allow faster response times, and less strain on the server
- datetime based search for search previous day/time weather data
- weather forecasting feature
- unit of measurement options
- lat and long parameter options