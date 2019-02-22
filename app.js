const createError = require('http-errors');
const express = require('express');
const mysql = require("mysql");
const path = require('path');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const session = require('express-session');

//client routing
const indexRouter = require('./routes/client');
const addRouter = require('./routes/client/add_recipe');
const categoryRouter = require('./routes/client/category');
//admin routing
const indexAdmin = require('./routes/admin');
const loginAdmin = require('./routes/admin/login');
const logoutAdmin = require('./routes/admin/logout');

const app = express();
const port = 3000;

// view engine setup
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(fileUpload());
app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized: true
}));

app.use('/', indexRouter);
app.use('/add', addRouter);
app.use('/kategoria', categoryRouter);
app.use('/admin', indexAdmin);
app.use('/login', loginAdmin);
app.use('/logout', logoutAdmin);



const db = mysql.createConnection ({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'db_przepisy'
});
// connect to database
db.connect((err) => {
  if (err) throw err;
  else console.log('Połączono z baza danych');
});
global.db = db;

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

app.listen(port, () => {
    console.log(`Server running on port: ${port}`);
});

module.exports = app;

