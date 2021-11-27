

const mysql = require('mysql')


const DB = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'photo-management-system'
})

DB.connect((err) => {
  if(!err){
    console.log("Connected successfully")
    // DB.query('SELECT 1 FROM FROM posts', (err, result)=>{
    //    if(err){
    //       console.log("Creating table")
    //       DB.query('CREATE TABLE posts(id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, title VARCHAR(60) NOT NULL, img_url TEXT NOT NULL, description VARCHAR(100) NOT NULL, created TIMESTAMP DEFAULT CURRENT_TIMESTAMP )')
    //        console.log("Table created")
    //   }else{
    //     console.log("Table already exists")
    //   }
    // })
  }else{
    console.log("Failed to connect")
  }
}
)

module.exports = DB


