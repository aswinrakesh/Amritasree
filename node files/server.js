// Importing all core modules
var express = require('express');
var http = require('http');
var mysql = require('mysql');
var app = express();
var bodyParser = require('body-parser');
var dateFormat = require('dateformat');

//Parse all form data
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//Create database connection using mysql
const con = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "",
	database: "amritasree"
});

//Global site title
const siteTitle = "AmritaSREE mobile application"
const baseUrl = "http://localhost:4000/"
var MemberID;

// //Query to store MemberID
app.post('/getMemberID',function(req, res){

	MemberID = req.body.MemberID;
	console.log(MemberID+'\n');
});

//Query to retrieve Pending Loan Amount
app.get('/totalloan',function(req, res){
	var query = "SELECT SUM(LoanRepayAmt) AS TotalPaid, MIN(LoanAmountRemaining) AS RemainingAmount FROM DepositTable where MemberID=" + MemberID;
	con.query(query, function(err,result){
		// console.log(result);
		var output = JSON.stringify(result);
		console.log(output+'\n');
		res.json(result);
	});
});

//Query to retrieve SAVINGS
app.get('/savings',function(req, res){
	var query = "SELECT SUM(WeeklyDeposit) AS PresentSavings, MIN(LoanAmountRemaining) AS RemainingLoanAmount, (SUM(WeeklyDeposit)-LoanAmountRemaining) AS Savings FROM DepositTable WHERE MemberID=" + MemberID;
	con.query(query, function(err,result){
		// console.log(result);
		var output = JSON.stringify(result);
		console.log(output+'\n');
		res.json(result);
	});
});

//Query to retrieve LOAN AMOUNT
app.get('/loanAmount',function(req, res){
	var query = "SELECT LoanAmount AS LoanAmount FROM LoanDetailsTable WHERE MemberID=" + MemberID;
	con.query(query, function(err,result){
		// console.log(result);
		var output = JSON.stringify(result);
		console.log(output+'\n\n');
		res.json(result);
	});
});

//Query to retrieve LOAN PAID
app.get('/depositDetails',function(req, res){
	var query = "SELECT SUM(LoanRepayAmt) AS LoanPaid, (0.2*SUM(LoanRepayAmt)) AS InterestPaid, MIN(LoanAmountRemaining) AS RemainingLoanAmount, (0.2*MIN(LoanAmountRemaining)) AS RemainingInterest, (0.2*MIN(LoanAmountRemaining)+MIN(LoanAmountRemaining)) AS Balance FROM DepositTable WHERE MemberID=" + MemberID;
	con.query(query, function(err,result){
		// console.log(result);
		var output = JSON.stringify(result);
		console.log(output+'\n\n');
		res.json(result);
	});
});

//Query to retrieve PAYMENT ALERT
app.get('/paymentAlert',function(req, res){
	var query = "SELECT WeeklyDeposit AS LastPayment, MAX(Date) AS DateofPayment FROM DepositTable WHERE Date IN(SELECT MAX(Date) FROM DepositTable WHERE MemberID='"+MemberID+"')";
	con.query(query, function(err,result){
		// console.log(result);
		var output = JSON.stringify(result);
		console.log(output+'\n');
		res.json(result);
	});
});

//Query to retrieve data
app.get('/',function(req, res){
	var query = "select * from membertable";
	con.query(query, function(err,result){
		// console.log(result);
		var output = JSON.stringify(result);
		console.log(output+'\n\n');
		res.json(result);
	});
});

app.get('/cr/:group_id',function(req,resp){
	con.query('SELECT * FROM grouptable WHERE GroupID =?',[req.params.group_id],
		function(error,rows,fields){
			if(!!error)
				console.log('Error');
			else{
				resp.json(rows);
			}
	});
})
app.get('/ATGget',function(req, res){
	var query = "select * from grouptable WHERE GroupID!=1";
	con.query(query, function(err,result){
		// console.log(result);
		var output = JSON.stringify(result);
		console.log(output+'\n\n');
		res.json(result);
	});
});


app.get('/:username',function(req,resp){
	con.query('SELECT * FROM membertable WHERE username = ?',[req.params.username],
		function(error,rows,fields){
			if(!!error)
				console.log('Error');
			else{
				resp.json(rows);
			}
	});
});
app.get('/number/get/:PhNo',function(req,resp){
	con.query('SELECT * FROM membertable WHERE PhNo = ?',[req.params.PhNo],
		function(error,rows,fields){
			if(!!error)
				console.log('Error');
			else{
				resp.json(rows);
			}
	});
});
app.get('/getcluster/:district',function(req,resp){
	con.query('SELECT ClusterID FROM clustertable WHERE District =?',[req.params.district],
		function(error,rows,fields){
			if(!!error)
				console.log('Error');
			else{
				resp.json(rows);
			}
	});
})

app.get('/getclusterid/:clustername',function(req,resp){
	con.query('SELECT ClusterID FROM clustertable WHERE ClusterName =?',[req.params.clustername],
		function(error,rows,fields){
			if(!!error)
				console.log('Error');
			else{
				resp.json(rows);
			}
	});
})

app.post('/atg/:PhNo',function(req,res){
	console.log(req.body);
  con.query('UPDATE membertable SET GroupID = ? WHERE PhNo = ?',[req.body.GroupID,req.params.PhNo],function(error,rows,fields){
    if(!!error){
      console.log(error);
    }
    else{
      res.send(JSON.stringify(rows));
    }
  });
})

app.post('/cr/:group_id',function(req,res){
	console.log(req.body);
  con.query('UPDATE grouptable SET ClusterID = ?, district = ? WHERE GroupID = ?',[req.body.ClusterID,req.body.district,req.params.group_id],function(error,rows,fields){
    if(!!error){
      console.log(error);
    }
    else{
      res.send(JSON.stringify(rows));
    }
  });
})
app.post('/cr',function(req,res){
	var postData=req.body;
	con.query('INSERT INTO clustertable SET ?',postData,function(error,rows,fields){
	  if(!!error){
		console.log(error);
	  }
	  else{
		res.send(JSON.stringify(rows));
	  }
	});
  })

app.post('/grpreg',function(req,res){
	var postData=req.body;
	con.query('INSERT INTO grouptable SET ?',postData,function(error,rows,fields){
	  if(!!error){
		console.log(error);
	  }
	  else{
		res.send(JSON.stringify(rows));
	  }
	});
  })


// //Query to insert data
app.post('/register',function(req, res){

	var MemberName = req.body.MemberName;
	var Address = req.body.Address;
	var Age = req.body.Age;
	var EducationalQualification = req.body.EducationalQualification;
	var APLorBPL =  req.body.APLorBPL;
	var PhNo = req.body.PhNo;
	var GroupRole = req.body.GroupRole;
	var GroupID = req.body.GroupID;
	var Username = req.body.Username;
	var Password = req.body.Password;
	var SecurityQuestion = req.body.SecurityQuestion;
	var Answer = req.body.Answer;

	var query = "INSERT INTO `membertable` (`MemberID`, `MemberName`, `Address`, `Age`, `EducationalQualification`, ";
		query += "`APLorBPL`, `PhNo`, `GroupRole`, `GroupID`, `Username`, `Password`,`SecurityQuestion`, `Answer`) VALUES (NULL, ";
		query += "'"+MemberName+"','"+Address+"','"+Age+"','"+EducationalQualification+"','"+APLorBPL+"','"+PhNo+"','"+GroupRole+"','"+GroupID+"','"+Username+"','"+Password+"','"+SecurityQuestion+"','"+Answer+"')";

	con.query(query, function(err,result){
		console.log(err+'\n\n'+result+'\n\n');
	});
});

//Connect to server
var server = app.listen(4000,function(){
	console.log("Server started on 4000...");
});
