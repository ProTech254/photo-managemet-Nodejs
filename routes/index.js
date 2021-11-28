var express = require('express');
var router = express.Router();

var mysql = require('mysql');
var bcrypt = require('bcrypt');

const sessions = require('express-session');
const DB = require("../database/connection.js")


/* GET home page. */
router.get('/', function(req, res, next) {
  DB.query('SELECT * FROM posts', (err,blogPost) => {
    if(err){
      console.log(err)
    }else{
     res.render('index', {blogPost });
    }
  })
});

router.get('/search', function(req, res, next) {
  DB.query('SELECT * FROM posts', (err,blogPost) => {
    if(err){
      console.log(err)
    }else{
     res.render('search', {blogPost });
    }
  })
});

router.get('/Login', (req,res,next) => {
  res.render('Login');
});


router.post('/auth', (req,res,next) => {
  var email = req.body.email;
  var password =req.body.password;

  var sql = 'select * from users where email = ?;';
  
  DB.query(sql,[email], function(err,result, fields){
    if(err) throw err;

    if(result.length && bcrypt.compareSync(password, result[0].password)){
      // request.session.loggedin = true;
      // request.session.email = email;
      res.redirect('/');
    }else{
      res.send('Incorrect Email or Password');
      res.redirect('/');
    }
  });
});

router.get('/Logout', (req,res,next) => {
  req.session.loggedin = false;
  req.session.username = null;
  res.redirect('/');
});
router.get('/Registration', (req,res,next) => {
  res.render('Registration');
});

router.post('/Register', (req,res,next) => {
  var username = req.body.username;
  var email = req.body.email;
  var password = req.body.password;
  var cpassword = req.body.cpassword;

  if(cpassword == password){

    var sql = 'select * from users where email = ?;';

    DB.query(sql,[email], function(err, result, fields){
      if(err) throw err;

      if(result.length > 0){
        res.send('Email Already Exists');
      }else{

        var hashpassword = bcrypt.hashSync(password, 10);
        var sql = 'insert into users(username,email,password) values(?,?,?);';

        DB.query(sql,[username,email, hashpassword], function(err, result, fields){
          if(err) throw err;
          res.render('ssuccess');
        });
      }
    });
  }else{
    res.send('Password Does Not Match');
    res.redirect('/');
  }
});
router.get('/Newpost', (req,res,next) => {
  res.render('PostImage');
});

 // viewing the post
router.get('/ViewPost/:id', (req,res,next ) => {
  DB.query('SELECT * FROM posts WHERE id = ?',[req.params.id], (err, selectPost) => {
    if(err){
      console.log(err)
    }else{
      res.render('Viewpost', {selectPost});
    }
  } );
});

router.get('/Delete/:id', (req,res,next ) => {
  DB.query('DELETE FROM posts WHERE id = ?',[req.params.id], (err) => {
    if(err){
      console.log(err)
    }else{
      res.render('success');
    }
  } );
});

// edit blog post
router.get('/Edit/:id', (req,res,next ) => {
  const id = req.params.id
  const post = req.body
  DB.query('SELECT * FROM posts WHERE id = ?',[req.params.id], (err, post) => {
    if(err){
      console.log(err)
    }else{
      res.render('Image',{post});
    }
  } );
});

// Update method for /edit page
router.post('/Update/:id', (req,res,next ) => {
  DB.query(  'UPDATE posts SET title = ?, img_url = ?, description = ? ,username = ? WHERE id = ?',
  [req.body.title, req.body.img_url, req.body.description, req.body.username, req.params.id], (err, selectPost) => {
    if(err){
      console.log(err)
    }else{
      res.render('psuccess');
    }
  } );
});


// Update method for /edit page
router.post('/new', (req,res,next ) => {
  DB.query('INSERT INTO posts(title, img_url, description, username, created) VALUES(?, ?, ?, ?, NOW())',
  [req.body.title, req.body.img_url, req.body.description, req.body.username], (err) => {
    if(err){
      console.log(err)
    }else{
      res.render('psuccess');
    }
  } );

});

// Update method for /edit page
router.post('/comment', (req,res,next ) => {
  DB.query(  'UPDATE posts SET comment = ? WHERE id = ?',
  [req.body.comment, req.params.id], (err) => {
    if(err){
      console.log(err)
    }else{
      res.render('psuccess');
    }
  } );

});



module.exports = router;
