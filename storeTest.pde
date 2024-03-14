class StoreTest
{
  String date;
  String airline;
  String originAirport;
  String originCity;
  String originState;
  int originWAC;
  String destinationAirport;
  String destinationCity;
  String destinationState;
  int destinationWAC;
  int scheduledDeparture;
  int actualDeparture;
  int scheduledArrival;
  int actualArrival;
  int isCancelled;
  int isDiverted;
  int distanceTraveledMi;
  
  StoreTest(String date, String airline, String originAirport, String originCity, String originState, int originWAC, String destinationAirport, String destinationCity, String destinationState,
  int destinationWAC, int scheduledDept, int actualDept, int scheduledArr, int actualArr, int isCancelled, int isDiverted, int distanceTraveledMi)
  {
    this.date = date;
    this.airline = airline;
    this.originAirport = originAirport;
    this.originCity = originCity;
    this.originState = originState;
    this.originWAC = originWAC;
    this.destinationAirport = destinationAirport;
    this.destinationCity = destinationCity;
    this.destinationState = destinationState;
    this.destinationWAC = destinationWAC;
    scheduledDeparture = scheduledDept;
    actualDeparture = actualDept;
    scheduledArrival = scheduledArr;
    actualArrival = actualArr;
    this.isCancelled = isCancelled;
    this.isDiverted = isDiverted;
    this.distanceTraveledMi = distanceTraveledMi;
  }
  
  String printFlight()
  {
    String cancelledStatus = "";
    String divertedStatus = "";
    
    String flightDetails = "Date: " + date + "\nAirline: " + airline + "\nOrigin Airport: " + originAirport + "\nOrigin City: " + originCity + "\nOrigin State: " + originState + "\norigin WAC: " + originWAC +
    "\nDestination Airport: " + destinationAirport + "\nDestinationCity: " + destinationCity + "\nDestination State: " + destinationState + "\nDesintation WAC: " + destinationWAC + "\nScheduled Departure: "
    + scheduledDeparture + "\nactualDeparture: " + actualDeparture + "\nscheduledArrival: " + scheduledArrival + "\nactualArrival: " + actualArrival;
    
    if(isCancelled == 1)
    {
      cancelledStatus = "Yes";
    }
    else
    {
      cancelledStatus = "No";
    }
    
    if(isDiverted == 1)
    {
      divertedStatus = "Yes";
    }
    else
    {
      divertedStatus = "No";
    }
    
    flightDetails = flightDetails + "\nCancelled: " + cancelledStatus + "\nDiverted: " + divertedStatus + "\nDistanced Traveled (in Miles): " + distanceTraveledMi;
    return flightDetails + "\n";
  }
  
}
