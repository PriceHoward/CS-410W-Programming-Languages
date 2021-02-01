/*
 * Price Howard
 * CS-410W
 * 2/1/21
 * The program will take in input from a file and calculate the average rainfall and the smallest and greatest amount of rainfall in a certain month then output it onto the screen as well as a graph that shows every month and the rainfall that happened that month.
 */
package main
import(
	"fmt"
	"log"
	"bufio"
	"strings"
	"os"
	"strconv"
)
const SIZEOFARRAY = 12 //Creating a constant for the array size.
/*
 * Name: getRainFall() 
 * Purpose: To grab the rainfall data from the file. Then parse it to be a float and return it to the maon function. Making sure to error check if the data size is correct in the file.
 * Incoming: None
 * Return: lines(float64), error
 */
func getRainFall()([]float64,error){
	var lines []float64
	var counter int
	file,err:=os.Open("rainfall.txt")
	if err!= nil{
		return nil, err
	}
	scanner:=bufio.NewScanner(file)
	counter = 0
	for scanner.Scan(){
		line := scanner.Text()
		line = strings.TrimSpace(line)
		convertedLine, err := strconv.ParseFloat(line,64) 
		if err!= nil{
			log.Fatal(err)
		}
		lines = append(lines, convertedLine)
		counter++
	}
	if counter != SIZEOFARRAY {
		return nil, fmt.Errorf("%s", "Not Enough Data In The File")
	}
	err = file.Close()
	if err != nil{
		return nil, err
	}
	if scanner.Err() != nil{
		return nil, scanner.Err()
	}
	return lines, nil
}

/*
 * Name: printRainfallTable
 * Purpose:To print the rainfall table in aligned columns. Months on the left rainfall data for that month on the right. 
 * Incoming: arrayData(float64), arrayMonths(string)
 * Return:None
 */
func printRainfallTable(arrayData[]float64, arrayMonths[12]string){
	fmt.Println("Months \t\t\t\t Rainfall")
	fmt.Println("-------------------------------------------------------------------")
	for i:=0; i < len(arrayData); i++{
		if arrayMonths[i] == "September" || arrayMonths[i] == "November" || arrayMonths[i] == "December"{
			fmt.Printf("%s \t\t",arrayMonths[i])
		}else if arrayMonths[i] != "September" || arrayMonths[i] != "November" || arrayMonths[i] != "December"{

			fmt.Printf("%-s\t\t\t",arrayMonths[i])
		}
		fmt.Printf("%15.1f\n", arrayData[i])
	}
}
/*
 * Name: computerRainFall
 * Purpose: To compute theaverage rainfall while also finding the largest amount of rainfall and the smallest amount of rainfall and returning the index of those in the array.
 * Incoming:arrayData(float64)
 * Return:smallestIndex(int), largestIndex(int), averagePerMonth(float64), error
 */
func computeRainFall(arrayData[] float64)(int, int, float64, error){
	smallestIndex := 100
	largestIndex := 0
	sumOfData := 0.00
	averagePerMonth := 0.00
	tempDataConvert := 50.00
	for i:=0; i < len(arrayData); i++{
		if tempDataConvert > arrayData[i]{
			smallestIndex = i
			tempDataConvert = arrayData[i]
		}
		sumOfData = arrayData[i] + sumOfData
	}
	tempDataConvert = 0.00
	for i:=0; i < len(arrayData); i++{
		if tempDataConvert < arrayData[i]{
			largestIndex = i
			tempDataConvert = arrayData[i]
		}
	}
	averagePerMonth = sumOfData/ float64(len(arrayData))
	return smallestIndex, largestIndex, averagePerMonth, nil
}
/*
 * Name:main()
 * Purpose:The main driver of the function. It will call all of the other functions and declare the months array. It will also print out the data given from smallest rainfall and largest rainfall.
 * Incoming: None
 * Return: None
 */
func main(){
	var data []float64
	var month = [12]string{"January", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
	var err error
	data,err =  getRainFall()
	if err != nil{
		log.Fatal(err)
	}
	var smallest int
	var largest int
	var avg float64
	smallest, largest, avg, err = computeRainFall(data)
	if err != nil{
		log.Fatal(err)
	}
	printRainfallTable(data, month)
	fmt.Printf("Month with least RainFall: %s. With a value of: %.1f\n", month[smallest],data[smallest])
	fmt.Printf("Month with most Rainfall: %s. With A value of: %.1f\n", month[largest],data[largest])
	fmt.Printf("The average rainfall through out the year is: %.1f\n", avg)
	
}
