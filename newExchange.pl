#!/usr/bin/perl
# Price Howard
# 2/21/21
# CS 410W
# Program will take user input from a HTML page and calculate the exchanged money by grabbing the correct money exchange rate from a file and then converting the money. It will then store the money inputed, the exchanged money, and the date and time of the transaction. The all of those perameters will also be printed to the webpage. cs.csis.work/~prhowa/exchangeMoney.html. This uses the CGI library to print it into a formatted HTML webpage.


use CGI qw(:standard);
print header();
print start_html(-title=>"Money Exchange",
		 -head=>Link({-rel => 'stylesheet',
		              -type => 'text/css',
			      -href => 'styles.css'}));
$usDollars = param("USD");
$moneyChoice = param("money");
open(FP,"exchangeRate.txt") or die ("File failed to open");
@data = <FP>;
close(FP);
chomp(@data);
$dateString = localtime();
$typeOfMoney = " ";
	if($moneyChoice eq "b"){
		$convertedMoney = $usDollars * @data[0];
		$typeOfMoney = "Pounds";
	}

	#If statements for equating the money exchange for Euros
	elsif($moneyChoice eq "e"){
		$convertedMoney = $usDollars * @data[1];
		$typeOfMoney = "Euros";
	}
	
	#If statements for equating the money exchange for Mexican Pesos
	elsif($moneyChoice eq "m"){
		$convertedMoney = $usDollars * @data[2];
		$typeOfMoney = "Mexican Pesos";
	}
	
	
	#If statements for equating the money exchange for Canadian Dollars.
	elsif($moneyChoice eq "c"){
		$convertedMoney = $usDollars * @data[3];
		$typeOfMoney = "Canadian Dollars";
	}
open(FP, ">>exchangeRecord.txt");
$convertedMoney = sprintf("%.2f",$convertedMoney);
$usDollars = sprintf("%.2f", $usDollars);
print FP "$dateString\n";
printf FP "Inputed USD: %.2f\n", $usDollars;
printf FP "Exchanged Money: %.2f %s\n\n", $convertedMoney, $typeOfMoney;

print "<h> $dateString<\h>\n";
printf "<h1>Inputed USD: %.2f<\h1>\n ", $usDollars;
printf  "<h1>Exchanged Money: %.2f %s</h1>\n ", $convertedMoney, $typeOfMoney; 
print   "<p>Back to <a href=\"index.html\">Home</a>.</p>\n";
print end_html();
