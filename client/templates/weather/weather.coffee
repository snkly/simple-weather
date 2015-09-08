Template.weather.helpers
  currentCity : ->
    Session.get 'weatherCity'
  currentWeather : ->
    weatherCity = Session.get('weatherCity')
    Meteor.call 'getWeatherInfo', weatherCity, (err, results) ->
      console.log results.content
      Session.set 'weatherType', JSON.parse(results.content).weather[0].description
      return
    Session.get('weatherType')
  #weatherIcon : ->
  #  weatherCity = Session.get('weatherCity')
  #  Meteor.call 'getWeatherInfo', weatherCity, (err, results) ->
  #    Session.set 'weatherIcon', JSON.parse(results.content).weather[0].icon
  #    return
  #  icon = Session.get('weatherIcon')
  #  return $('#icon').attr('src','<img src=http://openweathermap.org/img/w/' + icon + '.png')>')
  currentTemp : ->
    weatherCity = Session.get('weatherCity')
    Meteor.call 'getWeatherInfo', weatherCity, (err, results) ->
      Session.set 'weatherTemp', JSON.parse(results.content).main["temp"]
      return
    temp = Session.get('weatherTemp')
    newTemp = (temp * 9/5 - 459.67)
    return newTemp + '°' + 'F'
  hotOrCold : ->
    temp = Session.get('weatherTemp')
    newTemp = (temp * 9/5 - 459.67)
    if newTemp > 85
      return 'Its hot outside!'
    else if newTemp > 75
      return 'The temperature is very nice.'
    else if newTemp > 65
      return 'Its very cool.'
    else
      return 'Its cold! Bring a jacket.'
  currentCoord : ->
    weatherCity = Session.get('weatherCity')
    Meteor.call 'getWeatherInfo', weatherCity, (err, results) ->
      Session.set 'weatherCoordLon', JSON.parse(results.content).coord["lon"]
      Session.set 'weatherCoordLat', JSON.parse(results.content).coord["lat"]
      return

    'Lat is ' + Session.get('weatherCoordLat') + ' Longitude is ' + Session.get('weatherCoordLon')
  currentRise : ->
    weatherCity = Session.get('weatherCity')
    Meteor.call 'getWeatherInfo', weatherCity, (err, results) ->
      Session.set 'weatherSunrise', JSON.parse(results.content).sys["sunrise"]
      Session.set 'weatherSunset', JSON.parse(results.content).sys["sunset"]
      return
    Session.get('weatherSunset')
    Session.get('weatherSunrise')

Template.weather.events
  'change .weatherCityOption': (evt, tmpl) ->
    Session.set 'weatherCity', tmpl.find('.weatherCityOption').value
    return

