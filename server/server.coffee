Meteor.methods
  getWeatherInfo: (weatherOption) ->
    Meteor.http.call "GET", "http://api.openweathermap.org/data/2.5/weather?q=" + weatherOption
