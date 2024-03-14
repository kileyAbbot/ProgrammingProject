Table flightTable;
ArrayList <StoreTest> flightsInfo = new ArrayList<StoreTest>();
void setup()
{
  flightTable = loadTable("flights2kCSV.csv", "header");
  /*  StoreTest(String date, String airline, String originAirport, String originCity, String originState, int originWAC, String destinationAirport, String destinationCity, String destinationState,
  int destinationWAC, int scheduledDept, int actualDept, int scheduledArr, int actualArr, int isCancelled, int isDiverted, int distanceTraveledMi)*/
  for(TableRow row : flightTable.rows())
  {
    flightsInfo.add(new StoreTest(row.getString("FL_DATE"), row.getString("MKT_CARRIER"), row.getString("ORIGIN"), row.getString("ORIGIN_CITY_NAME"), row.getString("ORIGIN_STATE_ABR"),
    row.getInt("ORIGIN_WAC"), row.getString("DEST"), row.getString("DEST_CITY_NAME"), row.getString("DEST_STATE_ABR"), row.getInt("DEST_WAC"), row.getInt("CRS_DEP_TIME"), row.getInt("DEP_TIME"),
    row.getInt("CRS_ARR_TIME"), row.getInt("ARR_TIME"), row.getInt("CANCELLED"), row.getInt("DIVERTED"), row.getInt("DISTANCE")));
  }
  
  for(int i = 0; i < 5; i++)
  {
    System.out.println(flightsInfo.get(i).printFlight());
  }
  
  
}
