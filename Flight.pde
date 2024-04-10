class Flight
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
  int actualDepartureInMinutes;
  int scheduledDepartureInMinutes;
  int actualArrivalInMinutes;
  int scheduledArrivalInMinutes;
  int isCancelled;
  int isDiverted;
  int distanceTraveledMi;
  int scheduledTimeToTakeInMinutes;
  int actualTimeTakenInMinutes;
  int departureLateness;
  int departureEarliness;
  int arrivalLateness;
  int arrivalEarliness;
  int flightDay;
  double flightAverageSpeed;
  
  Flight(String date, String airline, String originAirport, String originCity, String originState, int originWAC, String destinationAirport, String destinationCity, String destinationState,
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
    scheduledDepartureInMinutes = query.getActualTimeInMinutes(scheduledDeparture);
    actualDepartureInMinutes = query.getActualTimeInMinutes(actualDeparture);
    scheduledArrivalInMinutes = query.getActualTimeInMinutes(scheduledArrival);
    actualArrivalInMinutes = query.getActualTimeInMinutes(actualArrival);
    this.isCancelled = isCancelled;
    this.isDiverted = isDiverted;
    this.distanceTraveledMi = distanceTraveledMi;
    departureLateness = query.actualLateOrEarliness(scheduledDepartureInMinutes, actualDepartureInMinutes);
    departureEarliness = query.actualLateOrEarliness( actualDepartureInMinutes, scheduledDepartureInMinutes);
    arrivalLateness = query.actualLateOrEarliness(scheduledArrivalInMinutes, actualArrivalInMinutes);
    arrivalEarliness = query.actualLateOrEarliness(actualArrivalInMinutes, scheduledArrivalInMinutes);
    scheduledTimeToTakeInMinutes = query.properTimeTaken(scheduledArrivalInMinutes,scheduledDepartureInMinutes);
    actualTimeTakenInMinutes = query.properTimeTaken(actualDepartureInMinutes, actualArrivalInMinutes);
    flightDay = getFlightDay();
    flightAverageSpeed = getAverageSpeed();
    System.out.println(flightAverageSpeed);
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
  
  String getDate()
  {
    return date;
  }
  
  String getAirline()
  {
    return airline;
  }
  
  String getOriginAirport()
  {
    return originAirport;
  }
  
  String getOriginCity()
  {
    return originCity;
  }
  
  String getOriginState()
  {
    return originState;
  }
  
  int getOriginWAC()
  {
    return originWAC;
  }
  
  String getDestinationAirport()
  {
    return destinationAirport;
  }
  
  String getDestinationCity()
  {
    return destinationCity;
  }
  
  String getDestinationState()
  {
    return destinationState;
  }
  
  int getDestinationWAC()
  {
    return destinationWAC;
  }
  
  int getScheduledDeparture()
  {
    return scheduledDeparture;
  }
  
  int getActualDeparture()
  {
    return actualDeparture;
  }
  
  int getScheduledArrival()
  {
    return scheduledArrival;
  }
  
  int getActualArrival()
  {
    return actualArrival;
  }
  
  int getIsCancelled()
  {
    return isCancelled;
  }
  
  int getIsDiverted()
  {
    return isDiverted;
  }
  
  int getDistanceTraveled()
  {
    return distanceTraveledMi;
  }
  
  int getFlightMonth()
  {
    String totalDate = date;
    String updatedDate = "";
    String[] monthPart = totalDate.split("/");
    String numberMonth = monthPart[0];
    int month = Integer.valueOf(numberMonth);
    return month;
  }
  
 int getFlightDay()
  {
    String totalDate = date;
    
    String[] dayPart = totalDate.split("/");
    String numberDay = dayPart[1];
    
    int day = Integer.valueOf(numberDay);
    return day;
    
  }
  
  int getScheduledDepartureHour()
  {
    int hour = 0;
    int time = scheduledDeparture;
    if(time >= 1000)
    {
      hour = time / 100;
    }
    else if(time >= 100)
    {
      hour = time / 100;
    }
    else
    {
      hour = 0;
    }
    return hour;
  }
  
  String getScheduledDepartureMinute()
  {
    int timeInt = scheduledDeparture;
    String timeString = "";
    while(timeInt > 100)
    {
      timeInt = timeInt - 100;
    }
    if(timeInt == 100)
    {
     return timeString = "00";
    }
    else
    {
      timeString = timeString + timeInt;
      if(timeString.length() == 1)
      {
        timeString = "0" + timeString;
      }
      return timeString;
    }
  }
  
  
  int getActualArrivalHour()
  {
    int hour = 0;
    int time = actualArrival;
    if(time >= 1000)
    {
      hour = time / 100;
    }
    else if(time >= 100)
    {
      hour = time / 100;
    }
    else
    {
      hour = 0;
    }
    return hour;
  }
  
  
  String getActualArrivalMinute()
  {
    int timeInt = actualArrival;
    String timeString = "";
    while(timeInt > 100)
    {
      timeInt = timeInt - 100;
    }
    if(timeInt == 100)
    {
     return timeString = "00";
    }
    else
    {
      timeString = timeString + timeInt;
      if(timeString.length() == 1)
      {
        timeString = "0" + timeString;
      }
      return timeString;
    }
  }
  
  
  
  boolean flightCancelled()
  {
    if(isCancelled == 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean flightDiverted()
  {
    if(isDiverted == 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
    
  double getAverageSpeed()
  {
      if (actualTimeTakenInMinutes <= 0 || distanceTraveledMi <= 0 ) 
    {
      flightAverageSpeed = 0;
    }
    else 
    {
      flightAverageSpeed = (double) distanceTraveledMi/ ((double)actualTimeTakenInMinutes / 60);
    }
    return flightAverageSpeed;
  }
  
  String decodeAirline(Flight plane)
  {
    String airline = plane.getAirline();
    String fullAirline = "";
    if(airline.equals("AA"))
    {
      fullAirline = "American Airlines";
    }
    else if(airline.equals("AS"))
    {
      fullAirline = "Alaska Airlines";
    }
    else if(airline.equals("B6"))
    {
      fullAirline = "JetBlue";
    }
    else if(airline.equals("HA"))
    {
      fullAirline = "Hawaiian Airlines";
    }
    else if(airline.equals("NK"))
    {
      fullAirline = "Spirit Airlines";
    }
    else if(airline.equals("AS"))
    {
      fullAirline = "Alaska Airlines";
    }
    else if(airline.equals("G4"))
    {
      fullAirline = "Allegiant Airlines";
    }
    else if(airline.equals("WN"))
    {
      fullAirline = "Southwest Airlines";
    }
    else if(airline.equals("F9"))
    {
      fullAirline = "Frontier Airlines";
    }
    else if(airline.equals("UA"))
    {
      fullAirline = "United Airlines";
    }
    else if(airline.equals("DL"))
    {
      fullAirline = "Delta Airlines";
    }
    return fullAirline;
  }
}
