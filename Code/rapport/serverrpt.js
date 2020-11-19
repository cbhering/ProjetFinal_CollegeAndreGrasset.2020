var http = require('http');
var https = require('https');
var url = require('url');
var formidable = require('formidable');
var mysql = require('mysql');
var fs = require('fs');
var excel = require('exceljs')
var page;
var page2;
var debut;
var fin;
var debut1;
var fin1;
var donnee;
var donnee1;
var nombre;
var random;
var random1;

http.createServer(function (req, res) { 
    console.log("entry1: " + req.url);
    console.log("entry2: " + url.parse(req.url, true).pathname.split("/")[1]  );
    if (req.url == '/myaction') { //lorseque les dates sont entrees et validees sur la page rapportinscription
      try {
          if (fs.existsSync("../rapport-temp/Rapport Inscription "+debut+" à "+fin+"_"+random+".xlsx")) {
            //file exists
            fs.unlink("../rapport-temp/Rapport Inscription "+debut+" à "+fin+"_"+random+".xlsx", (err) => {
              if (err) throw err;
              console.log('successfully deleted file');
            });
          }
        } catch(err) {
          console.error(err)
        }
    	var form = new formidable.IncomingForm();
        fs.readFile("rapportInscription.html", function (err, data) { // on recupere les information de la page rapport(datge debut et date de fin)
          page2 = "<script>";
          form.parse(req, function (err, fields1, files) {
              var con = mysql.createConnection({
    		  host: 'localhost',
    		  database: 'instit43_jpo_test',
    		  user: 'root',
    		  password: 'root',
                  multipleStatements: true    
              });
              con.connect(function (err) {
                  if (err) throw err;
                  console.log("Connected");
                  console.log(fields1.debut);
                  console.log(fields1.fin);
                  //var temp = parseInt(fields1.fin.charAt(fields1.fin.length-2)) + 1;
                  //var temp = parseInt(fields1.fin.slice(8,fields1.length))+1;
                  var temp1 = fields1.fin +" 23:59:59";
                 // console.log(temp + "  C'est la daaaaaaaaaate");
                 // temp1= fields1.fin.slice(0,temp1.length-2);
                 // temp1= temp1 + temp;
                  //console.log(temp); 
                  console.log(temp1);
                  //var sql1 = "Select COUNT(idguests) from guests ";
                 var sql = "Select inscription.date, inscription.lastname, inscription.firstname, inscription.phone, inscription.mail, inscription.country, inscription.state, program.programdescription , inscription.moyencommunication from inscription LEFT JOIN interestingprogrammes ON inscription.mail = interestingprogrammes.mail INNER JOIN program ON interestingprogrammes.idprogram = program.idprogram where inscription.date >= ? and inscription.date <= ? ORDER BY(inscription.date);Select COUNT(idguests) as Nombre from guests where dateadmission >= ? and dateadmission <= ?";
                  console.log(sql);
                  con.query(sql, [fields1.debut,temp1,fields1.debut,temp1], function (err, result1,fields) {
                      if (err) throw err;
                      donnee1 = result1[0]; // prends le resultat 
                      nombre = result1[1];
                      con.end(function (err) {
                            if (err) {
                                return console.log('error:' + err.message);
                            }
                            console.log('Database connection closed.');
                            page2 += ' </script>';
                            debut = fields1.debut;
                            fin = fields1.fin;
                            random = Math.random();
                            console.log(random);
                            console.log(fields1.debut + ' ' + fields1.fin + ' data saved again');
                            console.log(donnee1);
                            console.log(nombre[0].Nombre);
                            if(isNaN(fields1.fin[0]) || isNaN(fields1.debut[0])){
                              fields1.fin = "M-DD-YY-Y-";
                              fields1.debut = "M-DD-YY-Y-";
                            }
                            if (typeof fields1.debut !== 'undefined' && fields1.debut !== null && fields1.debut !=="M-DD-YY-Y-"&&
                            	typeof fields1.fin !== 'undefined' && fields1.fin !== null && fields1.fin !=="M-DD-YY-Y-") {
	                            let workbook = new excel.Workbook(); // pour creer un nouveaux fichier excel 
	                            let worksheet = workbook.addWorksheet('inscription') // pour creer une nouvelle page 
	                            worksheet.columns = [                                // creer les titres et les colomnes 
	                              {header: 'date', key: 'date'},                     // donner un nom aux titres 
	                              {header: 'Nom', key: 'lastname'},
	                              {header: 'Prenom', key: 'firstname'},
	                              {header: 'Telephone', key: 'phone'},
	                              {header: 'Mail', key: 'mail'},
	                              {header: 'Pays', key: 'country'},
	                              {header: 'Province', key: 'state'},
	                              {header: 'Programme', key: 'programdescription'},
	                              {header: 'Moyen de Communication', key: 'moyencommunication'}
	                            ];
	                            worksheet.columns.forEach(column => {            //gerer la taille des colonnes
	                                column.width = column.header.length < 12 ? 12 : column.header.length //si la taille du titre est plus grand que 12 on lui donne la taille de la colonne
	                            });
	                            worksheet.getColumn("E").width = 25;    // changer manuellement la taille de la colonne
	                            worksheet.getColumn("H").width = 50;   // pareil
	                            const cell2 = worksheet.getCell('K1');   // mettre une cellule dans une variable par exemple ici la cellule K1
	                            cell2.value = "Nombre d'invités";        // change la valeur de la cellule 
	                            worksheet.getRow(1).font = {bold: true}; // modifie le style de caracthere de toute la rangee 1

	                       
	                            // Dump all the data into Excel
	                            donnee1.forEach((e, index) => {       //place les information de la base de donnee dans le classeur
	                            // row 1 is the header.
	                                const rowIndex = index + 2
	                                worksheet.addRow({
	                                    ...e,
	                                  });
	                            });                                  // fin du placement des donnees
	                            const cell = worksheet.getCell('K2');
								              cell.value = nombre[0].Nombre; //ici nombre vaut le nombre de guests 
	                            workbook.xlsx.writeFile('../rapport-temp/Rapport Inscription '+fields1.debut+' à '+fields1.fin+'_'+random+'.xlsx'); // ecrit le classeur avec la date de debut et de fin dans le nom
                              //res.write('<script>document.getElementById("acc").innerHTML = "";</script>');
                              page2 +='<center>'+
                                        '<form id="frm" method="POST" action="download" onsubmit="disapear()">'+
                                            '<input class="bouton-rouge-small blanc" style="width:fit-content; padding-bottom: 15px;" type="submit" value="Télécharger">'+ 
                                          '</form>'+
                                      '</center>'+
                                      '<br>'+
                                     '<a href="http://jpo-rapport.institutgrassetinfo.com:4012/">'+
                                          ' <h5 id="acc" class="w300" style="color: #162b65; text-align: right;"><br>Revenir à la page d\'accueil du site'+
                                          '</h5>'+
                                      '</a>';
                              res.writeHead(200, { 'Content-Type': 'text/html' });
                              res.write(page);
                              res.write(page2);
                              res.write('<script> document.getElementById("rp").innerHTML = "Données sauvegardés avec succès à <br> "+Date();'+
                                        'document.getElementById("acc").innerHTML = ""; </script>');
                              res.end();
                            }else{
                              res.writeHead(200, { 'Content-Type': 'text/html' });
                              res.write(page);
                              res.write(page2);
                              res.write('<script> document.getElementById("rp").innerHTML = " Aucune Données sauvegardées <br> "</script>');
                              res.end();
                            }
                        });
                    });
                });
            });
        });
    }
        if (req.url == '/myaction1') {
           try {
            if (fs.existsSync("../rapport-temp/Rapport Programme "+debut1+" à "+fin1+"_"+random1+".xlsx")) {
              //file exists
              fs.unlink("../rapport-temp/Rapport Programme "+debut1+" à "+fin1+"_"+random1+".xlsx", (err) => {
                if (err) throw err;
                console.log('successfully deleted file');
              });
            }
          } catch(err) {
            console.error(err)
          }
    	var form = new formidable.IncomingForm();
        fs.readFile("rapportProgramme.html", function (err, data) {
          page2 = "<script>";
          form.parse(req, function (err, fields1, files) {
              var con = mysql.createConnection({
                  host: "23.235.197.135",
                  user: "instit43_jpo-test_adm",
                  password: "jpo2020",
                  database: "instit43_jpo-test",
                  multipleStatements: true    
              });
              con.connect(function (err) {
                  if (err) throw err;
                  console.log("Connected");
                  console.log(fields1.debut);
                  console.log(fields1.fin);
                  var sql ="Select COUNT(interestingprogrammes.mail)as NombreDePersonnesInscrites, program.programdescription "
                        + "FROM interestingprogrammes LEFT JOIN inscription " 
                        + "ON inscription.mail = interestingprogrammes.mail " 
                        + "INNER JOIN program ON interestingprogrammes.idprogram = program.idprogram "
                        + "WHERE inscription.date >= ? AND inscription.date <= ? "
                        + "GROUP BY(program.programdescription)";
                 // var temp2 = parseInt(fields1.fin.charAt(fields1.fin.length-2)) + 1;
                  var temp3 = fields1.fin +" 23:59:59";
                  //console.log(temp2 + "  C'est la daaaaaaaaaate");
                  //temp3= fields1.fin.slice(0,temp3.length-2);
                  //temp3= temp3 + temp2; 
                  console.log(temp3);
                  console.log(sql);
                  con.query(sql, [fields1.debut,temp3], function (err, result1,fields) {
                      if (err) throw err;
                      donnee1 = result1;
                      con.end(function (err) {
                            if (err) {
                                return console.log('error:' + err.message);
                            }
                            console.log('Database connection closed.');
                            page2 += ' </script>';
                            debut1 = fields1.debut;  
                            fin1 = fields1.fin;  
                            random1 = Math.random();
                            console.log(random);
                            console.log(fields1.debut + ' ' + fields1.fin + ' data saved again');
                            console.log(debut1 + ' ' + fin1+ ' globales');
                            console.log(donnee1);
                            if( isNaN(fields1.fin[0])|| isNaN(fields1.debut[0])){
                              fields1.fin = "M-DD-YY-Y-";
                              fields1.debut = "M-DD-YY-Y-";
                            }
                            if (typeof fields1.debut !== 'undefined' && fields1.debut !== null && fields1.debut !=="M-DD-YY-Y-"&&
                            	typeof fields1.fin !== 'undefined' && fields1.fin !== null && fields1.fin !=="M-DD-YY-Y-") {
	                            let workbook = new excel.Workbook();
	                            let worksheet = workbook.addWorksheet('Programme')
	                            worksheet.columns = [
	                              {header: 'NombreDePersonnesInscrites', key: 'NombreDePersonnesInscrites'},
	                              {header: 'programdescription', key: 'programdescription'},
	               				      ];
	                            worksheet.columns.forEach(column => {
	                                column.width = column.header.length < 12 ? 12 : column.header.length
	                            });
	                            worksheet.getRow(1).font = {bold: true};
	                            // Dump all the data into Excel
	                            donnee1.forEach((e, index) => {
	                            // row 1 is the header.
	                                const rowIndex = index + 2
	                                worksheet.addRow({
	                                    ...e,
	                                  });
	                            });
	                            workbook.xlsx.writeFile('../rapport-temp/Rapport Programme '+fields1.debut+' à '+fields1.fin+"_"+random1+'.xlsx');
                              page2 +='<center>'+
                                        '<form id="frm" method="POST" action="download1" onsubmit="disapear()">'+
                                            '<input class="bouton-rouge-small blanc" style="width:fit-content; padding-bottom: 15px;" type="submit" value="Télécharger">'+ 
                                          '</form>'+
                                      '</center>'+
                                      '<br>'+
                                     '<a href="http://jpo-rapport.institutgrassetinfo.com:4012/">'+
                                          ' <h5 id="acc" class="w300" style="color: #162b65; text-align: right;"><br>Revenir à la page d\'accueil du site'+
                                          '</h5>'+
                                      '</a>'; 

                              res.writeHead(200, { 'Content-Type': 'text/html' });
                              res.write(page);
                              res.write(page2);
                              res.write('<script> document.getElementById("rp").innerHTML = "Données sauvegardés avec succès à <br> "+Date();'+
                                        'document.getElementById("acc").innerHTML = ""; </script>');
    
                              res.end();                     
                            }else{
                              res.writeHead(200, { 'Content-Type': 'text/html' });
                              res.write(page);
                              res.write(page2);
                              res.write('<script> document.getElementById("rp").innerHTML = " Aucune Données sauvegardées <br> "</script>');
                              res.end();
                            }
                        });
                    });
                });
            });
        });
    }
    if (req.url == '/download') { // pour telecharger le fichier creer sur rapport inscritpion.
      try{
        if (fs.existsSync("../rapport-temp/Rapport Inscription "+debut+" à "+fin+"_"+random+".xlsx")) {
        //file exists
            if (typeof debut !== 'undefined' && debut !== null && debut !=="M-DD-YY-Y-"&&
                typeof fin !== 'undefined' && fin !== null && fin !=="M-DD-YY-Y-") {
                    console.log(random);
                    var file = "../rapport-temp/Rapport Inscription "+debut+' à '+fin+"_"+random+".xlsx";
                    var files = fs.createReadStream(file);
                    res.writeHead(200, {'Content-disposition': 'attachment; filename=' + file}); //here you can specify file name
                    files.pipe(res);
                    files.on('end',function(){
                      fs.unlink(file, (err) => {
                        if (err) throw err;
                        console.log('successfully deleted file');
                      });
                    });
             // files.close() // also you can set content-type
            }else{
              page2 =+"<b> Aucune donnee <b>";
              res.writeHead(200, { 'Content-Type': 'text/html' });
              res.write(page);
              res.write(page2);
              res.end();
            }
        }else{
            page2=+"<b> Aucun fichier <b>";
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(page);
            //res.write(page2);
            console.log("else du fichier non exists");
            res.end();
        }
      } catch(err) { 
       console.error(err)    
      }
    }  

    if (req.url == '/download1') { // pour telecharger le fichier creer sur rapport de programme
         console.log(debut1 + ' ' + fin1 + ' globales à download1');
        try {
          if (fs.existsSync("../rapport-temp/Rapport Programme "+debut1+" à "+fin1+"_"+random1+".xlsx")) {
              //file exists

            if (typeof debut1 !== 'undefined' && debut1 !== null && debut1 !=="M-DD-YY-Y-"&&
                typeof fin1 !== 'undefined' && fin1 !== null && fin1 !=="M-DD-YY-Y-") {   
                   console.log(random1+"dans download1");   
                    var file1 = "../rapport-temp/Rapport Programme "+debut1+' à '+fin1+"_"+random1+".xlsx";
                    var files1 = fs.createReadStream(file1);
                    res.writeHead(200, {'Content-disposition': 'attachment; filename='+ file1}); //here you can specify file name 
                    files1.pipe(res);
                    files1.on('end',function(){
                       fs.unlink(file1, (err) => {
                          if (err) throw err;
                          console.log('successfully deleted file');
                        });
                    });
              //files.close() // also you can set content-type
            }else{
              page2 =+"<b> Aucune donnee d<b>";
              res.writeHead(200, { 'Content-Type': 'text/html' });
              res.write(page);
              res.write(page2);
              res.end();
            }  
            // ici try
          }else{
            page2=+"<b> Aucun fichier <b>";
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(page);
            //res.write(page2);
            console.log("else du fichier non exists");
            res.end();
          }
        } catch(err) {
          console.error(err)
        } 
    }

    if (req.url == '/ins') { // la page du rapport d'inscription : rapportinscription.html 
        fs.readFile("rapportInscription.html", function (err, data) {
            if (err) {
                res.writeHead(404, { 'Content-Type': 'text/html' });
                return res.end("404 Not Found");
            }
            page = data;
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(page);
            res.end();
        });       
    }

    if (req.url == '/prog') {  
        fs.readFile("rapportProgramme.html", function (err, data) {
            if (err) {
                res.writeHead(404, { 'Content-Type': 'text/html' });
                return res.end("404 Not Found");
            }
            page = data;
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(page);
            res.end();
        });       
    }

    if (req.url == '/' || page == undefined) { // Dossier Racine quand url = / 
        fs.readFile("index.html", function (err, data) {
            if (err) {
                res.writeHead(404, { 'Content-Type': 'text/html' });
                return res.end("404 Not Found");
            }
            page = data;
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.write(page);
            res.end();
            console.log('index.html');
        });
    }
    
  /*if (req.url == '/stylesheets/bootstrap.css') {
    fs.readFile("./stylesheets/bootstrap.css", function (err, data) {
      if (err) {
        res.writeHead(404, { 'Content-Type': 'text/css' });
        return res.end("404 Not Found");
      }
      res.writeHead(200, { 'Content-Type': 'text/css' });
      res.write(data);
      res.end();
      console.log('bootstrap.css');
    });
  }

  if (req.url == '/stylesheets/custom2.css') {
    fs.readFile("./stylesheets/custom2.css", function (err, data) {
      if (err) {
        res.writeHead(404, { 'Content-Type': 'text/css' });
        return res.end("404 Not Found");
      }
      res.writeHead(200, { 'Content-Type': 'text/css' });
      res.write(data);
      res.end();
      console.log('custom2.css');
    });
  }*/
  
  if (url.parse(req.url, true).pathname.split("/")[1] == 'stylesheets') {
    fs.readFile("."+req.url, function (err, data) {
      if (err) {
        res.writeHead(404, { 'Content-Type': 'text/css' });
        return res.end("404 Not Found");
      }
      res.writeHead(200, { 'Content-Type': 'text/css' });
      res.write(data);
      res.end();
      console.log("entry3: " + req.url);
    });
  }
  
  if (url.parse(req.url, true).pathname.split("/")[1] =='images') {
    fs.readFile("."+req.url, function (err, data) {
      if (err) {
        res.writeHead(404, { 'Content-Type': 'text/css' });
        return res.end("404 Not Found");
      }
      res.writeHead(200, { 'Content-Type': 'text/css' });
      res.write(data);
      res.end();
      console.log("entry3: " + req.url);
    });
  }

 // if (req.url == '/favicon.ico') { 
 //     res.writeHead(200, { 'Content-Type': 'text/css' });
 //     res.write("");
 //     res.end();
 //     console.log("favicon done"); }
    
}).listen(4012);       
