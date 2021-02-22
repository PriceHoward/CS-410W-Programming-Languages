#!/usr/bin/perl

print "Content-Type: Text/html\n\n";
$str = $ENV{QUERY_STRING};
($str1, $str2) = split(/&/,$str); 
($dummy,$usDollars) = split(/=/,$str1);
($dummy,$moneyChoice) = split(/=/,$str2);
	
	if($moneyChoice eq "b"){
		$convertedMoney = $usDollars * .73;
	}

	#If statements for equating the money exchange for Euros
	elsif($moneyChoice eq "e"){
		$convertedMoney = $usDollars * .83;
	}
	
	#If statements for equating the money exchange for Mexican Pesos
	elsif($moneyChoice eq "m"){
		$convertedMoney = $usDollars * 20.13;
	}
	
	
	#If statements for equating the money exchange for Canadian Dollars.
	elsif($moneyChoice eq "c"){
		$convertedMoney = $usDollars * 1.27;
	}
$convertedMoney = sprintf("%.2f",$convertedMoney);
$usDollars = sprintf("%.2f", $usDollars);		
print"<!DOCTYPE html>\n";
print"<head>\n";
print" <meta charset=\"UTF-8\">\n";
print"<link rel=\"stylesheet\" href=\"styles.css\" type=\"text/css\">\n";
print"<title>Money Exchanger</title>\n";
print"</head>\n";
print"<body>\n";
print"<h1>Exchanged Money</h1>\n";
print"<h2> The Amount of USD Inputed: $usDollars</h2>\n";
print"<h2> The Converted Money Is: $convertedMoney</h2>\n";
print"<p>Back to <a href=\"index.html\">Home</a>.</p>\n";
print"</body>\n";

