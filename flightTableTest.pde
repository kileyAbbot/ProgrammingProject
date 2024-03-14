Table flightTable;
ArrayList <Flight> flightsInfo = new ArrayList<Flight>();
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
  int longestDistanceFlightIndex = getLongestDistanceFlightIndex();
  longestDistanceFlightString += "The greatest distance travelled was " + flightsInfo.get(longestDistanceFlightIndex).distanceTraveledMi + " miles, on " +
  flightsInfo.get(longestDistanceFlightIndex).date + " with " + flightsInfo.get(longestDistanceFlightIndex).airline + " from " + flightsInfo.get(longestDistanceFlightIndex).originAirport + ", " + 
  flightsInfo.get(longestDistanceFlightIndex).originCity + ", " + flightsInfo.get(longestDistanceFlightIndex).originState + " to " + flightsInfo.get(longestDistanceFlightIndex).destinationAirport +
  ", " + flightsInfo.get(longestDistanceFlightIndex).destinationCity + ", " + flightsInfo.get(longestDistanceFlightIndex).destinationState;
  textSize(20);
  text(longestDistanceFlightString, 500, 100 );
  
  String shortestDistanceFlightString = "";
  int shortestDistanceFlightIndex = getShortestDistanceFlightIndex();
  shortestDistanceFlightString += "The least distance travelled was " + flightsInfo.get(shortestDistanceFlightIndex).distanceTraveledMi + " miles, on " +
  flightsInfo.get(shortestDistanceFlightIndex).date + " with " + flightsInfo.get(shortestDistanceFlightIndex).airline + " from " + flightsInfo.get(shortestDistanceFlightIndex).originAirport + ", " + 
  flightsInfo.get(shortestDistanceFlightIndex).originCity + ", " + flightsInfo.get(shortestDistanceFlightIndex).originState + " to " + flightsInfo.get(shortestDistanceFlightIndex).destinationAirport +
  ", " + flightsInfo.get(shortestDistanceFlightIndex).destinationCity + ", " + flightsInfo.get(shortestDistanceFlightIndex).destinationState;
  textSize(20);
  text(shortestDistanceFlightString, 500, 200 );
  
  String averageDistanceString ="";
  double averageFlightDistance = getAverageFlightDistance();
  averageDistanceString+="Average miles travelled by flights in this dataset : " + averageFlightDistance;
  textSize(20);
  text(averageDistanceString, 500, 250 );
  
  String rangeString="";
  int rangeDistance = getRangeDistance();
  rangeString+="Range of distance in miles travelled by flights in this dataset : " + rangeDistance;
  textSize(20);
  text(rangeString, 500, 300 );
  
  String standardDeviationString="";
  double standardDeviation = getStandardDeviation();
  standardDeviationString+="Standard deviation of distance travelled by flights in miles in this dataset : " + standardDeviation;
  textSize(20);
  text(standardDeviationString, 500, 350 );


}

int getLongestDistanceFlightIndex()
{
  
  int distance = 0;
  int flightInfo = 0;
 
  for ( int i = 0; i<flightsInfo.size(); i++ ) 
  {
    if ( flightsInfo.get(i).distanceTraveledMi > distance )
    {
      distance = flightsInfo.get(i).distanceTraveledMi;
      flightInfo = i;
    }
  }
  
  return flightInfo;
}

int getShortestDistanceFlightIndex()
{
  int distance = 99999;
  int flightInfo = 0;
 
  for ( int i = 0; i<flightsInfo.size(); i++ ) 
  {
    if ( flightsInfo.get(i).distanceTraveledMi < distance )
    {
      distance = flightsInfo.get(i).distanceTraveledMi;
      flightInfo = i;
    }
  }
  
  return flightInfo;
}

double getAverageFlightDistance()
{
  
  double total = 0;
 
  for ( int i = 0; i<flightsInfo.size(); i++ )
  {
    int distance  = flightsInfo.get(i).distanceTraveledMi;
    total+=(double)distance;
  }
  
  double average = total/flightsInfo.size();
  return average;
  
}

int getRangeDistance()
{
  int longestDistanceFlightIndex = getLongestDistanceFlightIndex();
  int shortestDistanceFlightIndex = getShortestDistanceFlightIndex();
  int range = flightsInfo.get(longestDistanceFlightIndex).distanceTraveledMi - flightsInfo.get(shortestDistanceFlightIndex).distanceTraveledMi;
  return range;
}

double getStandardDeviation()
{
  double average = getAverageFlightDistance();
  double sumOfSquaredDifferences = 0.0; 
  for ( int i = 0; i<flightsInfo.size(); i++)
  {
   double difference=(flightsInfo.get(i).distanceTraveledMi-average);
   sumOfSquaredDifferences+=Math.pow(difference,2);
  }
  
  double variance = sumOfSquaredDifferences/(flightsInfo.size()-1);
  double standardDeviation = Math.sqrt(variance);
  return standardDeviation;
  
}
