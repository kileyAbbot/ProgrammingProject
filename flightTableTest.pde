Table flightTable;
ArrayList <Flight> flightsInfo = new ArrayList<Flight>();
final int SCREEN_X = 1920;
final int SCREEN_Y = 1080;
final int BAR_CHART_MARGIN = 50; 
final int BAR_CHART_BAR_LENGTH = 50; 
final int BAR_CHART_MAX_HEIGHT = 400;
final int BAR_CHART_HEIGHT = 500;
final int LINE_CHART_ORIGIN_X = 100;
final int LINE_CHART_ORIGIN_Y = SCREEN_Y-100; // 980
void setup()
{
  size(1920, 1080);
  flightTable = loadTable("flights2kCSV.csv", "header");
  /*  Flight(String date, String airline, String originAirport, String originCity, String originState, int originWAC, String destinationAirport, String destinationCity, String destinationState,
  int destinationWAC, int scheduledDept, int actualDept, int scheduledArr, int actualArr, int isCancelled, int isDiverted, int distanceTraveledMi)*/
  for(TableRow row : flightTable.rows())
  {
    flightsInfo.add(new Flight(row.getString("FL_DATE"), row.getString("MKT_CARRIER"), row.getString("ORIGIN"), row.getString("ORIGIN_CITY_NAME"), row.getString("ORIGIN_STATE_ABR"),
    row.getInt("ORIGIN_WAC"), row.getString("DEST"), row.getString("DEST_CITY_NAME"), row.getString("DEST_STATE_ABR"), row.getInt("DEST_WAC"), row.getInt("CRS_DEP_TIME"), row.getInt("DEP_TIME"),
    row.getInt("CRS_ARR_TIME"), row.getInt("ARR_TIME"), row.getInt("CANCELLED"), row.getInt("DIVERTED"), row.getInt("DISTANCE")));
  }
  
  for(int i = 0; i < 5; i++)
  {
    System.out.println(flightsInfo.get(i).printFlight());
  }
    
  int[] flightDistanceFrequency = getFlightDistanceFrequencyArray( flightsInfo, 1000 );
  
  for ( int i = 0; i<flightDistanceFrequency.length; i++ )
  {
    println("Number of flights in " + i*1000 + "-" + (i+1)*1000 + " miles bracket : " + flightDistanceFrequency[i]); 
  }
}
void draw()
{
  background(120);
  textSize(8);
 
  
 // displayFrequencyBarChart( flightsInfo, 1000 );
 // displayBoxes();
 // displayDescriptiveStatistics( flightsInfo );
 displayLineChartNumberOfFlights( flightsInfo, 1, 31 );



}




int getLongestDistanceFlightIndex( ArrayList flightsSet )
{
  
  ArrayList <Flight> flights = flightsSet;
  int distance = 0;
  int flightInfo = 0;
 
  for ( int i = 0; i<flights.size(); i++ ) 
  {
    if ( flights.get(i).distanceTraveledMi > distance )
    {
      distance = flights.get(i).distanceTraveledMi;
      flightInfo = i;
    }
  }
  
  return flightInfo;
}

int getShortestDistanceFlightIndex( ArrayList flightsSet )
{
  ArrayList <Flight> flights = flightsSet;
  int distance = flights.get(0).distanceTraveledMi;
  int flightInfo = 0;
 
  for ( int i = 0; i<flights.size(); i++ ) 
  {
    if ( flights.get(i).distanceTraveledMi < distance )
    {
      distance = flights.get(i).distanceTraveledMi;
      flightInfo = i;
    }
  }
  
  return flightInfo;
}

double getAverageFlightDistance( ArrayList flightsSet )
{
  
  ArrayList <Flight> flights = flightsSet;
  double total = 0;
 
  for ( int i = 0; i<flights.size(); i++ )
  {
    int distance  = flights.get(i).distanceTraveledMi;
    total+=(double)distance;
  }
  
  double average = total/flightsInfo.size();
  return average;
  
}

int getRangeDistance( ArrayList flightsSet )
{
  ArrayList <Flight> flights = flightsSet;
  int longestDistanceFlightIndex = getLongestDistanceFlightIndex( flights );
  int shortestDistanceFlightIndex = getShortestDistanceFlightIndex( flights );
  int range = flights.get(longestDistanceFlightIndex).distanceTraveledMi - flights.get(shortestDistanceFlightIndex).distanceTraveledMi;
  return range;
}

double getStandardDeviation( ArrayList flightsSet )
{
  ArrayList <Flight> flights = flightsSet;
  double average = getAverageFlightDistance( flights );
  double sumOfSquaredDifferences = 0.0; 
  for ( int i = 0; i<flights.size(); i++)
  {
   double difference=(flights.get(i).distanceTraveledMi-average);
   sumOfSquaredDifferences+=Math.pow(difference,2);
  }
  
  double variance = sumOfSquaredDifferences/(flights.size()-1);
  double standardDeviation = Math.sqrt(variance);
  return standardDeviation;
  
}


int getIntVariableInQuestion ( Flight flight, String variable )
{
  
  if ( variable == "DistanceTravelledMiles" )
  {
   return flight.distanceTraveledMi;
  }
  
  if ( variable == "DurationMinutes" ) 
  {
    /// Need method in flight for getting the duration in minutes of the flight 
   return 0; 
  }
  
  if ( variable == "Lateness" ) 
  {
    return 0;
  }
  
  else 
  {
   return 0; 
  }

}


/* 
  
 //////////////////////  GRAPHICAL DISPLAYS 
 
 
 IDEAS FOR GRAPHICAL DISPLAYS: 
 
 ////////////////////////////////////////////////////////////////////////////////////////////    FREQUENCY BAR CHART GIVEN A SET OF FLIGHTS 
 
 FREQUENCY OF FLIGHT DURATIONS IN SPECIFIED BRACKETS
 
 FREQUENCY OF CANCELLATIONS BY AIRLINE OR SOURCE AIRPORT 
 
 //////////////////////////////////////////////////////////////////////////////////////////// LINE CHART NO. OF FLIGHTS
 
 NO. OF FLIGHTS, DIFFERENT FLIGHTS EACH AIRLINE, OVER SPECIFIED DATE RANGE 
 X-AXIS : DATES WITHIN THE RANGE 
 Y-AXIS : COUNT OF FLIGHTS 
 
 /////////////////////////////////////////////////////////////////////// SCATTER PLOT 
 
 1. RELATIONSHIP BETWEEN SCHEDULED DEPARTURE TIME, ACTUAL DEPARTURE TIME FOR FLIGHTS FILTERED BY DATE RANGE, AIRLINE, ETC. 
 X: DEPARTURE TIME 
 Y: ARRIVAL TIME 

 2. RELATIONSHIP BETWEEN DISTANCE TRAVELLED AND DURATION OF FLIGHT
 X : DISTANCE TRAVELLED 
 Y : DURATION IN HOURS:MINUTES 
 
*/






/////////////////////////////////////////////////////////////////////////////////////////////////////////////// FREQUENCY BAR CHART 

int[] getFlightDistanceFrequencyArray( ArrayList flightsSet, int bracket )
{
  ArrayList <Flight> flights = flightsSet;
  int longestDistanceFlightIndex = getLongestDistanceFlightIndex( flights );
  int longestDistanceFlight = flights.get(longestDistanceFlightIndex).distanceTraveledMi;
  int flightDistanceBrackets = 0;
  for ( int i = 0; i<longestDistanceFlight; i+=bracket )
  {
    flightDistanceBrackets++;
  }
  
  int[] flightFrequency = new int[flightDistanceBrackets];
  
  for ( int i = 0; i<flights.size(); i++ )
  {
    for ( int a = 0; a<flightDistanceBrackets; a++ )
    {
      if ( flights.get(i).distanceTraveledMi>=a*bracket && flights.get(i).distanceTraveledMi<(a+1)*bracket )
      {
        flightFrequency[a]++;
      }
    }
  }
  
  return flightFrequency;
  
  // Should be able to alter this to make frequency of any statistic with adjustment 
  
}


void displayFrequencyBarChart( ArrayList flightsSet, int bracket  )
{
  
  int[] flightFrequency = getFlightDistanceFrequencyArray( flightsSet, 1000 );
  int mostFrequentBracketValueIndex = 0;
  int mostFrequentBracketValue = 0;
  
  for ( int i = 0; i<flightFrequency.length; i++ )
  {
   if ( flightFrequency[i] > mostFrequentBracketValue )
   {
    mostFrequentBracketValue=flightFrequency[i];
    mostFrequentBracketValueIndex=i; 
   }
  }
  
  for ( int i = 0; i<flightFrequency.length; i++)
  {
    float BAR_CHART_HEIGHT = BAR_CHART_MAX_HEIGHT*(((float)flightFrequency[i])/((float)mostFrequentBracketValue));
    
    
    rect( ((SCREEN_X/2) + (i*(BAR_CHART_BAR_LENGTH+BAR_CHART_MARGIN) )), ( (SCREEN_Y/2) + (BAR_CHART_MAX_HEIGHT-BAR_CHART_HEIGHT)), (BAR_CHART_BAR_LENGTH), (BAR_CHART_HEIGHT)) ;
    textSize(10);
    text( (((i)*bracket))+"-"+((i+1)*bracket), ((SCREEN_X/2) + (i*100)), (( (SCREEN_Y/2) + (BAR_CHART_MAX_HEIGHT-BAR_CHART_HEIGHT))+50));
    println((SCREEN_Y/2+((float)((float)BAR_CHART_MAX_HEIGHT)*((float)((i)/flightFrequency.length))) ));/// Why only output less than 3 numbers ??
    text(   flightFrequency[i], ((SCREEN_X/2) + (i*(BAR_CHART_BAR_LENGTH+BAR_CHART_MARGIN) )), ( (SCREEN_Y/2) + (BAR_CHART_MAX_HEIGHT-BAR_CHART_HEIGHT)) - 50 ) ;
    println("Actual departure : " + flightsInfo.get(i).getActualDeparture() + "Actual arrival : " + flightsInfo.get(i).getActualArrival());
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// DESCRIPTIVE STATISTICS 

void displayDescriptiveStatistics( ArrayList flightsSet )
{
  textSize(30);
  text("Descriptive statistic for the specified dataset: ", 500, 100 );
  
  ArrayList <Flight> flightsInfo = flightsSet;
  String longestDistanceFlightString = "";
  int longestDistanceFlightIndex = getLongestDistanceFlightIndex( flightsInfo );
  longestDistanceFlightString += "The greatest distance travelled was " + flightsInfo.get(longestDistanceFlightIndex).distanceTraveledMi + " miles, on " +
  flightsInfo.get(longestDistanceFlightIndex).date + " with " + flightsInfo.get(longestDistanceFlightIndex).airline + " from " + flightsInfo.get(longestDistanceFlightIndex).originAirport + ", " + 
  flightsInfo.get(longestDistanceFlightIndex).originCity + ", " + flightsInfo.get(longestDistanceFlightIndex).originState + " to " + flightsInfo.get(longestDistanceFlightIndex).destinationAirport +
  ", " + flightsInfo.get(longestDistanceFlightIndex).destinationCity + ", " + flightsInfo.get(longestDistanceFlightIndex).destinationState;
  textSize(20);
  text(longestDistanceFlightString, 500, 150 );
  
  String shortestDistanceFlightString = "";
  int shortestDistanceFlightIndex = getShortestDistanceFlightIndex( flightsInfo );
  shortestDistanceFlightString += "The least distance travelled was " + flightsInfo.get(shortestDistanceFlightIndex).distanceTraveledMi + " miles, on " +
  flightsInfo.get(shortestDistanceFlightIndex).date + " with " + flightsInfo.get(shortestDistanceFlightIndex).airline + " from " + flightsInfo.get(shortestDistanceFlightIndex).originAirport + ", " + 
  flightsInfo.get(shortestDistanceFlightIndex).originCity + ", " + flightsInfo.get(shortestDistanceFlightIndex).originState + " to " + flightsInfo.get(shortestDistanceFlightIndex).destinationAirport +
  ", " + flightsInfo.get(shortestDistanceFlightIndex).destinationCity + ", " + flightsInfo.get(shortestDistanceFlightIndex).destinationState;
  textSize(20);
  text(shortestDistanceFlightString, 500, 200 );
  
  String averageDistanceString ="";
  double averageFlightDistance = getAverageFlightDistance( flightsInfo );
  averageDistanceString+="Average miles travelled by flights  : " + averageFlightDistance;
  textSize(20);
  text(averageDistanceString, 500, 250 );
  
  String rangeString="";
  int rangeDistance = getRangeDistance( flightsInfo );
  rangeString+="Range of distance in miles travelled by flights : " + rangeDistance;
  textSize(20);
  text(rangeString, 500, 300 );
  
  String standardDeviationString="";
  double standardDeviation = getStandardDeviation( flightsInfo );
  standardDeviationString+="Standard deviation of distance travelled by flights in miles : " + standardDeviation;
  textSize(20);
  text(standardDeviationString, 500, 350 );
  
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// BOXES 

void displayBoxes()
{
  boolean switchedRows = false;
  int startingY = 0;
  String flightInfoScript;
  for(int i = 0; i < 8; i++)
  {
    flightInfoScript = flightsInfo.get(i).printFlight();
    if(startingY >= 800)
    {
      int startingX = 200;
      if(switchedRows == false)
      {
         startingY = 0;
         switchedRows = true;
      }
      if(switchedRows)
      {
        text(flightInfoScript, startingX, startingY, 800, 800);
        startingX += 200;
      }
    }
    else
    {
      text(flightInfoScript, 10, startingY, 800, 800);
    }
    startingY += 200;
  }
  
}

///////////////////////////////////////////////////////////////////////////////////////////////// LINE CHART 

void displayLineChartNumberOfFlights( ArrayList flightsSet, int startDay, int endDay )
{

  ArrayList <Flight> flights = new ArrayList<Flight>();
 int numberOfDaysConcerned = ( endDay - startDay ) + 1;
 if ( numberOfDaysConcerned < 2 ) 
 {
  textSize(200);
  text("ERROR: Need 2 more or dates selected ", SCREEN_X/2, SCREEN_Y/2);
 }
 
 else
 {
   
  ArrayList <String> airlinesConcerned = new ArrayList<String>();
  for ( int i = 0; i<flights.size(); i++ )
  {
    String airline = flights.get(i).airline;
    for ( int a = 0; a<airlinesConcerned.size(); a++ )
    {
      if ( airline != airlinesConcerned.get(a) )
      {
        airlinesConcerned.add(airline);
      }
    }
  }
  
  ArrayList <Integer> airlinesConcernedColourRed = new ArrayList<Integer>();
  ArrayList <Integer> airlinesConcernedColourGreen = new ArrayList<Integer>();
  ArrayList <Integer> airlinesConcernedColourBlue = new ArrayList<Integer>();
  for ( int i = 0; i<airlinesConcerned.size(); i++ )
  {
    
    airlinesConcernedColourRed.add((int)random(255));
    airlinesConcernedColourGreen.add((int)random(255));
    airlinesConcernedColourBlue.add((int)random(255));
    
  }
  
  // line(x1,y1,x2,y2)
  // ( 100, 980 ) 
  line( LINE_CHART_ORIGIN_X, LINE_CHART_ORIGIN_Y, LINE_CHART_ORIGIN_X, 200 );           // y axis 
  line( LINE_CHART_ORIGIN_X, LINE_CHART_ORIGIN_Y, SCREEN_X-200, LINE_CHART_ORIGIN_Y );  // x axis
  int lineChartLength = (SCREEN_X-200)-(LINE_CHART_ORIGIN_X);
  int lineChartHeight = LINE_CHART_ORIGIN_Y-200;
  
  textSize(20);
  text("Dates", SCREEN_X/2, SCREEN_Y-50);
  text("No. Flights", 60, SCREEN_Y/2 );
  
  for ( int i = 0; i<6; i++ )
  {
   textSize(10);
   text((i)*10, 80, LINE_CHART_ORIGIN_Y-((i/6)*lineChartHeight) );
  }
  
   for ( int i = 0; i<numberOfDaysConcerned; i++ )
   {
     
     
     
   }
    
  }
 
  
   
 }
  
void getFrequencyAirlineParticularDay()
{
  
}
  
  
    
