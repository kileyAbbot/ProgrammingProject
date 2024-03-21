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
  int isCancelled;
  int isDiverted;
  int distanceTraveledMi;
  
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
  
  int getFlightMonth(Flight flightForDate)
  {
    String totalDate = flightForDate.getDate();
    String updatedDate = "";
    for(int i = 0; i < date.length(); i++)
    {
      if(date.charAt(i) != '/')
      {
        String holder = totalDate.substring(i);
        updatedDate = updatedDate + holder;
      }
      else
      {
        break;
      }
    }
    int month = Integer.valueOf(updatedDate);
    return month;
  }
  
  int getFlightDay(Flight flightForData)
  {
    String totalDate = flightForData.getDate();
    String updatedDate = "";
    int countOfDashes = 0;
    for(int i = 0; i < date.length(); i++)
    {
      if(date.charAt(i) != '/' && countOfDashes == 1)
      {
        String holder = totalDate.substring(i);
        updatedDate = updatedDate + holder;
      }
      else if(countOfDashes == 0)
      {
        countOfDashes++; 
      }
      else
      {
        break;
      }
    }
    int day = Integer.valueOf(updatedDate);
    return day;
  }
  
  int getScheduledDepartureHour(Flight flightHour)
  {
    int hour = 0;
    int time = flightHour.getScheduledDeparture();
    if(time >= 1000)
    {
      hour = time / 100;
    }
    else if(time >= 100)
    {
      hour = time / 10;
    }
    else
    {
      hour = 0;
    }
    return hour;
  }
  
  
  boolean flightCancelled(Flight flightCancel)
  {
    if(flightCancel.getIsCancelled() == 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean flightDiverted(Flight flightDiv)
  {
    if(flightDiv.getIsDiverted() == 1)
    {
      return true;
    }
    else
    {
      return false;
    }
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
  
