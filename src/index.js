var express = require('express');

// Constants
var PORT = 80;

// App
var app = express();
app.get('/', function (req, res) {
  res.send('A brand new world!!!!!!!\n');
});

app.listen(PORT, "0.0.0.0");
console.log('Running on http://localhost:' + PORT);