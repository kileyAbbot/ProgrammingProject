Table flightTable;
ArrayList <Flight> flightsInfo = new ArrayList<Flight>();
final int SCREEN_X = 1920;
final int SCREEN_Y = 1080;
final int BAR_CHART_MARGIN = 50; 
final int BAR_CHART_BAR_LENGTH = 50; 
final int BAR_CHART_MAX_HEIGHT = 500;
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
    
  int[] flightDistanceFrequency = getFlightDistanceFrequencyArray( flightsInfo );
  
  for ( int i = 0; i<flightDistanceFrequency.length; i++ )
  {
    println("Number of flights in " + i*1000 + "-" + (i+1)*1000 + " miles bracket : " + flightDistanceFrequency[i]); 
  }
}
void draw()
{
  boolean switchedRows = false;
  int startingY = 0;
  background(0);
  textSize(8);
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
  averageDistanceString+="Average miles travelled by flights in this dataset : " + averageFlightDistance;
  textSize(20);
  text(averageDistanceString, 500, 250 );
  
  String rangeString="";
  int rangeDistance = getRangeDistance( flightsInfo );
  rangeString+="Range of distance in miles travelled by flights in this dataset : " + rangeDistance;
  textSize(20);
  text(rangeString, 500, 300 );
  
  String standardDeviationString="";
  double standardDeviation = getStandardDeviation( flightsInfo );
  standardDeviationString+="Standard deviation of distance travelled by flights in miles in this dataset : " + standardDeviation;
  textSize(20);
  text(standardDeviationString, 500, 350 );
  
  int[] flightDistanceFrequency = getFlightDistanceFrequencyArray( flightsInfo );
  displayFrequencyBarChart( flightDistanceFrequency );



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

int[] getFlightDistanceFrequencyArray( ArrayList flightsSet )
{
  ArrayList <Flight> flights = flightsSet;
  int longestDistanceFlightIndex = getLongestDistanceFlightIndex( flights );
  int longestDistanceFlight = flights.get(longestDistanceFlightIndex).distanceTraveledMi;
  int flightDistanceBrackets = 0;
  for ( int i = 0; i<longestDistanceFlight; i+=1000 )
  {
    flightDistanceBrackets++;
  }
  
  int[] flightFrequency = new int[flightDistanceBrackets];
  
  for ( int i = 0; i<flights.size(); i++ )
  {
    for ( int a = 0; a<flightDistanceBrackets; a++ )
    {
      if ( flights.get(i).distanceTraveledMi>=a*1000 && flights.get(i).distanceTraveledMi<(a+1)*1000 )
      {
        flightFrequency[a]++;
      }
    }
  }
  
  return flightFrequency;
  
  // Should be able to alter this to make frequency of any statistic with adjustment 
  
}

void displayFrequencyBarChart( int[] flightFrequency )
{
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
    
    
    rect( ((SCREEN_X/2) + (i*(BAR_CHART_BAR_LENGTH+BAR_CHART_MARGIN) )), ( (SCREEN_Y/3) + (BAR_CHART_MAX_HEIGHT-BAR_CHART_HEIGHT)), (BAR_CHART_BAR_LENGTH), (BAR_CHART_HEIGHT)) ;
    // println(i);
  }
}
