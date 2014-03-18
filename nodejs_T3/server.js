var http = require ("http");
var fs = require ("fs");
console.log("starting");
var host = "127.0.0.1";
var port = 1338;
var server = http.createServer(function(request,response){
	
	console.log("recieves request: "+request.url);
	fs.readFile("./trial1"+request.url, function(error,data){
			if(error){
			response.writeHead(404,{"Content-type":"text/plain"});
			response.end("Sorry page not found");

			}
		else{
			response.writeHead(200,{"Content-type":"text/html"});
			response.end(data);


			}
	
	});
	
});
server.listen(port,host,function(){
		console.log("listening "+host+":"+port);
	});

// Retrieve
var MongoClient = require('mongodb').MongoClient;

// Connect to the db
MongoClient.connect("mongodb://localhost:27017/exampleDb", function(err, db) {
  if(err) { return console.dir(err); }

  var collection = db.collection('test');
  var doc1 = {'hello':'doc1'};
  collection.insert(doc1, {safe: true}, function(err, records){
  console.log("Record added as "+records[0]._id);
});
console.log("data in");

});
