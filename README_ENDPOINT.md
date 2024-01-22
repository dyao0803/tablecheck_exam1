# ENDPOINT README

## Endpoint Documentation
|method|endpoint|description|
|-|-|-|
|GET|/api/v1/status|status checker|
|GET|api/v1/get_weather|weather request endpoint|

## Payload and Response Samples
### api/v1/status
> PAYLOAD SAMPLE
```
{}
```

> RESPONSE SAMPLE
```
{
  "status": "ok",
  "date": "2024-01-20T16:29:09.344+00:00",
  "success": true,
  "params": {
    "country": "PH",
    "city": "Makati",
    "type": "live",
    "controller": "api/v1/status",
    "action": "index"
  },
  "status_code": 200
}
```

### api/v1/get_weather
params table

|key|value type|description|sample value|
|-|-|-|-|
|country|string|country code. Use ISO 3166 country codes as value reference|US|
|state|string|state value. applicable to countries with states, i.e. United States|CA or California|
|city|string|city value.|Los Angeles|
|type|string|type of data to return, expected values: current, minutely, hourly, daily, alerts, all|current|

### LIVE DATA
> PAYLOAD SAMPLE
```
{
  "country": "US",
  "state": "CA",
  "city": "Los angeles",
  "type": "live"
}
```

> RESPONSE SAMPLE
```
{
  "result": {
    "lat": 34.0537,
    "lon": -118.2428,
    "timezone": "America/Los_Angeles",
    "timezone_offset": -28800,
    "current": {
      "dt": 1705769374,
      "sunrise": 1705762608,
      "sunset": 1705799436,
      "temp": 287.2,
      "feels_like": 286.83,
      "pressure": 1017,
      "humidity": 83,
      "dew_point": 284.36,
      "uvi": 0.47,
      "clouds": 100,
      "visibility": 9656,
      "wind_speed": 3.09,
      "wind_deg": 150,
      "weather": [
        {
          "id": 701,
          "main": "Mist",
          "description": "mist",
          "icon": "50d"
        }
      ]
    }
  },
  "success": true,
  "params": {
    "country": "US",
    "state": "CA",
    "city": "Los angeles",
    "type": "live",
    "controller": "api/v1/get_weather",
    "action": "show"
  },
  "status_code": 200,
  "status": "ok"
}
```

### Minutely
> PAYLOAD SAMPLE
```
{
  "country": "US",
  "state": "CA",
  "city": "Los angeles",
  "type": "minutely"
}
```

> RESPONSE SAMPLE
```
{
  "result": {
    "lat": 34.0537,
    "lon": -118.2428,
    "timezone": "America/Los_Angeles",
    "timezone_offset": -28800,
    "minutely": [
      {
        "dt": 1705769700,
        "precipitation": 0
      },
      {
        "dt": 1705769760,
        "precipitation": 0
      },
      .
      .
      .
    ]
  },
  "success": true,
  "params": {
    "country": "US",
    "state": "CA",
    "city": "Los angeles",
    "type": "minutely",
    "controller": "api/v1/get_weather",
    "action": "show"
  },
  "status_code": 200,
  "status": "ok"
}
```

### Hourly
> PAYLOAD SAMPLE
```
{
  "country": "US",
  "state": "CA",
  "city": "Los angeles",
  "type": "minutely"
}
```

> RESPONSE SAMPLE
```
{
  "result": {
    "lat": 34.0537,
    "lon": -118.2428,
    "timezone": "America/Los_Angeles",
    "timezone_offset": -28800,
    "hourly": [
      {
        "dt": 1705766400,
        "temp": 287.35,
        "feels_like": 286.97,
        "pressure": 1017,
        "humidity": 82,
        "dew_point": 284.32,
        "uvi": 0.16,
        "clouds": 100,
        "visibility": 10000,
        "wind_speed": 2.23,
        "wind_deg": 126,
        "wind_gust": 4.03,
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "pop": 0.58,
        "rain": {
          "1h": 0.26
        }
      },
      .
      .
      .
    ]
  },
  "success": true,
  "params": {
      "country": "US",
      "state": "CA",
      "city": "Los angeles",
      "type": "hourly",
      "controller": "api/v1/get_weather",
      "action": "show"
  },
  "status_code": 200,
  "status": "ok"
}
```

### Daily
> PAYLOAD SAMPLE
```
{
  "country": "US",
  "state": "CA",
  "city": "Los angeles",
  "type": "daily"
}
```

> RESPONSE SAMPLE
```
{
  "result": {
    "lat": 34.0537,
    "lon": -118.2428,
    "timezone": "America/Los_Angeles",
    "timezone_offset": -28800,
    "daily": [
      {
        "dt": 1705780800,
        "sunrise": 1705762608,
        "sunset": 1705799436,
        "moonrise": 1705783620,
        "moonset": 1705747320,
        "moon_phase": 0.34,
        "summary": "Expect a day of partly cloudy with rain",
        "temp": {
          "day": 287.32,
          "min": 286.5,
          "max": 288.37,
          "night": 286.71,
          "eve": 287.13,
          "morn": 287.56
        },
        "feels_like": {
          "day": 287.01,
          "night": 286.42,
          "eve": 286.83,
          "morn": 287.17
        },
        "pressure": 1015,
        "humidity": 85,
        "dew_point": 284.84,
        "wind_speed": 3.48,
        "wind_deg": 96,
        "wind_gust": 4.83,
        "weather": [
          {
            "id": 501,
            "main": "Rain",
            "description": "moderate rain",
            "icon": "10d"
          }
        ],
        "clouds": 100,
        "pop": 0.99,
        "rain": 6.22,
        "uvi": 2.25
      },
      .
      .
      .
    ]
  },
  "success": true,
  "alerts": {
    "sender_name": "Integrated Public Alerrt and Warning System (IPAWS)",
    "event": "some event",
    "start": "start date and time of alert",
    "end": "end date and time of alert",
    "description": "alert description",
    "tags": "alert tags"
  },
  "params": {
    "country": "US",
    "state": "CA",
    "city": "Los angeles",
    "type": "daily",
    "controller": "api/v1/get_weather",
    "action": "show"
  },
  "status_code": 200,
  "status": "ok"
}
```

### Alerts
> PAYLOAD SAMPLE
```
{
  "country": "US",
  "state": "CA",
  "city": "Los angeles",
  "type": "alerts"
}
```

> RESPONSE SAMPLE
```
{
  "result": {
    "lat": 34.0537,
    "lon": -118.2428,
    "timezone": "America/Los_Angeles",
    "timezone_offset": -28800
  },
  "success": true,
  "params": {
    "country": "US",
    "state": "CA",
    "city": "Los angeles",
    "type": "alerts",
    "controller": "api/v1/get_weather",
    "action": "show"
  },
  "status_code": 200,
  "status": "ok"
}
```