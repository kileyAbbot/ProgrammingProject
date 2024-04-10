import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;

public static class query
{
   
  public static ArrayList<Flight> getFlightsAssociatedWithOriginAirport(ArrayList<Flight> flights, ArrayList<String> originAirports)
    {
        String flightAirport;
        String flightAirportForComparison;
        ArrayList<Flight> flightsAssociatedWithAirports = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          for ( int a = 0; a < originAirports.size(); a++ )
          {
            flightAirport = flights.get(i).originAirport;
            flightAirportForComparison = originAirports.get(a);
            if ( flightAirport.equals(flightAirportForComparison) )
            {
            //  println( flightAirport );
              flightsAssociatedWithAirports.add(flights.get(i));
            }
          }
 
        }
        return flightsAssociatedWithAirports;
    }
    
       public static ArrayList<Flight> getFlightsAssociatedWithDestAirport(ArrayList<Flight> flights, ArrayList<String> destinationAirports)
    {
        String flightAirport;
        String flightAirportForComparison;
        ArrayList<Flight> flightsAssociatedWithAirports = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          for ( int a = 0; a < destinationAirports.size(); a++ )
          {
            flightAirport = flights.get(i).destinationAirport;
            flightAirportForComparison = destinationAirports.get(a);
            if ( flightAirport.equals(flightAirportForComparison) )
            {
             // println( flightAirport );
              flightsAssociatedWithAirports.add(flights.get(i));
            }
          }
 
        }
        return flightsAssociatedWithAirports;
    }
    
    public static ArrayList<Flight> getFlightsAssociatedWithOriginCity(ArrayList<Flight> flights, ArrayList<String> originCities)
    {
        String flightCity;
        String flightCityForComparison;
        ArrayList<Flight> flightsAssociatedWithCity = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          for ( int a = 0; a < originCities.size(); a++ )
          {
            flightCity = flights.get(i).originCity;
            flightCityForComparison = originCities.get(a);
            if ( flightCity.equals(flightCityForComparison) )
            {
              flightsAssociatedWithCity.add(flights.get(i));
            }
          }
 
        }
        return flightsAssociatedWithCity;
    }
    
     public static ArrayList<Flight> getFlightsAssociatedWithDestinationCity(ArrayList<Flight> flights, ArrayList<String> destinationCities)
    {
        String flightCity;
        String flightCityForComparison;
        ArrayList<Flight> flightsAssociatedWithCity = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          for ( int a = 0; a < destinationCities.size(); a++ )
          {
            flightCity = flights.get(i).destinationCity;
            flightCityForComparison = destinationCities.get(a);
            if ( flightCity.equals(flightCityForComparison) )
            {
              flightsAssociatedWithCity.add(flights.get(i));
            }
          }
 
        }
        return flightsAssociatedWithCity;
    }
    
   
      public static ArrayList<Flight>  getFlightsAssociatedWithOriginState(ArrayList<Flight> flights, ArrayList<String> originStates)
    {
        String flightState;
        String flightStateForComparison;
        ArrayList<Flight> flightsAssociatedWithState= new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          for ( int a = 0; a < originStates.size(); a++ )
          {
            flightState = flights.get(i).originState;
            flightStateForComparison = originStates.get(a);
            if ( flightState.equals(flightStateForComparison))
            {
              flightsAssociatedWithState.add(flights.get(i));
            }
          }
 
        }
        return flightsAssociatedWithState;
    }
    
    public static ArrayList<Flight> getFlightsAssociatedWithAirline(ArrayList<Flight> flights, ArrayList<String> airlines)
    {
        String flightAirline;
        String flightAirlineForComparison;
        ArrayList<Flight> flightsAssociatedWithAirline = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          for ( int a = 0; a < airlines.size(); a++ )
          {
            flightAirline = flights.get(i).airline;
            flightAirlineForComparison = airlines.get(a);
            if ( flightAirline.equals(flightAirlineForComparison) )
            {
              flightsAssociatedWithAirline.add(flights.get(i));
            }
          }
 
        }
        return flightsAssociatedWithAirline;
    }
   
      public static ArrayList<Flight> getFlightsWithinDateRange(ArrayList<Flight> flights, int startDate, int endDate)
    {
        ArrayList<Flight> flightsWithinDateRange = new ArrayList<>();   
        for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          if ( flights.get(i).getFlightDay() >= startDate && flights.get(i).getFlightDay() <= endDate )
          {
            flightsWithinDateRange.add( flights.get(i) );
          }
        }
        return flightsWithinDateRange;
    }
    
    public static ArrayList<Flight> getFlightsOnSpecificDate(ArrayList<Flight> flights, int flightMonth, int flightDay)
    {
        ArrayList<Flight> flightsOnDay = new ArrayList<>();   
        for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          if ( flights.get(i).getFlightMonth() == flightMonth && flights.get(i).getFlightDay() == flightDay )
          {
            flightsOnDay.add( flights.get(i) );
          }
        }
        return flightsOnDay;
    }
    
    
    
         public static ArrayList<Flight> getFlightsWithinActualTimeRange(ArrayList<Flight> flights, int startTime, int endTime)
    {
        ArrayList<Flight> flightsWithinTimeRange = new ArrayList<>();   
        for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          if ( flights.get(i).actualDeparture >= startTime && flights.get(i).actualDeparture <= endTime )
          {
            flightsWithinTimeRange.add( flights.get(i) );
          }
        }
            Collections.sort(flightsWithinTimeRange, new Comparator<Flight>() 
        {
        public int compare(Flight flight1, Flight flight2) 
        {
          // currently sorts from earliest time to latest time. Switching to "( flight2.actualDeparture, flight1.actualDeparture)"
          // will sort from latest time to earliest time
            return Integer.compare( flight1.actualDeparture, flight2.actualDeparture);  
        }
    }); 
        return flightsWithinTimeRange;
    }
    
       public static ArrayList<Flight> getFlightsWithinScheduledTimeRange(ArrayList<Flight> flights, int startTime, int endTime)
    {
        ArrayList<Flight> flightsWithinTimeRange = new ArrayList<>();   
        for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
          if ( flights.get(i).scheduledDeparture >= startTime && flights.get(i).scheduledDeparture <= endTime )
          {
            flightsWithinTimeRange.add( flights.get(i) );
          }
        }
            Collections.sort(flightsWithinTimeRange, new Comparator<Flight>() 
        {
        public int compare(Flight flight1, Flight flight2) 
        {
          // currently sorts from earliest time to latest time. Switching to "( flight2.scheduledDeparture, flight1.scheduledDeparture)"
          // will sort from latest time to earliest time
            return Integer.compare( flight1.scheduledDeparture, flight2.scheduledDeparture);  
        }
    }); 
        return flightsWithinTimeRange;
    }
    
    
   
     public static ArrayList<Flight> getCancelledFlights(ArrayList<Flight> flights)
     {
        ArrayList<Flight> cancelledFlights = new ArrayList<>();
        for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
            Flight flight = flights.get(i);
            if(flight.isCancelled == 1)
            {
               cancelledFlights.add(flight);
            }
        }
        return cancelledFlights;
     }
     
     public static ArrayList<Flight> getDivertedFlights(ArrayList<Flight> flights)
     {
        ArrayList<Flight> divertedFlights = new ArrayList<>();
        for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
            Flight flight = flights.get(i);
            if(flight.isDiverted == 1)
            {
               divertedFlights.add(flight);
            }
        }
        return divertedFlights;
     }
     
         public static ArrayList<Flight> getFlightsWithinDistanceRange( ArrayList<Flight> flights, int bracketLowerEnd, int bracketUpperEnd )
    {
     
      ArrayList<Flight> flightsWithinDistanceRange = new ArrayList<Flight>();
      for( int i = 0; i<flights.size(); i++ )
      {
        Flight flight = flights.get(i);
        if ( flights.get(i).distanceTraveledMi >= bracketLowerEnd && flights.get(i).distanceTraveledMi <= bracketUpperEnd )
        {
          flightsWithinDistanceRange.add(flight);
        }
      }
        Collections.sort(flightsWithinDistanceRange, new Comparator<Flight>() 
        {
        public int compare(Flight flight1, Flight flight2) 
        {
          // currently sorts from most late to least late. Switching to "return Integer.compare( flight1.lateness, flight2.lateness)"
          // will sort from least late to most late
            return Integer.compare( flight2.distanceTraveledMi, flight1.distanceTraveledMi);  
        }
    }); 
    return flightsWithinDistanceRange;
    }

public static ArrayList<String> getAllAirports(ArrayList<Flight> flights) 
{
    Set<String> airportSet = new HashSet<>();     // Use a HashSet to prevent adding duplicates. 
    for (Flight flight : flights) 
    { 
        airportSet.add(flight.getOriginAirport());
        airportSet.add(flight.getDestinationAirport());
    }
    return new ArrayList<>(airportSet);
}

public static ArrayList<String> getAllStates(ArrayList<Flight> flights) 
{
    Set<String> statesSet = new HashSet<>();     // Use a HashSet to prevent adding duplicates. 
    for (Flight flight : flights) 
    { 
        statesSet.add(flight.getOriginState());
        statesSet.add(flight.getDestinationState());
    }
     //btw in flights_full there are 53 because of the Virgin Islands (VI), Puerto Rico (PR) and Guam/Saipan (TT)
    return new ArrayList<>(statesSet);
}

public static ArrayList<String> getAllCities(ArrayList<Flight> flights) 
{
    Set<String> citySet = new HashSet<>();     // Use a HashSet to prevent adding duplicates. 
    for (Flight flight : flights) 
    { 
        citySet.add(flight.getOriginCity());
        citySet.add(flight.getDestinationCity());
    }
    return new ArrayList<>(citySet);
}

public static ArrayList<String> getAllAirlines(ArrayList<Flight> flights) 
{
    Set<String> airlineSet= new HashSet<>();     // Use a HashSet to prevent adding duplicates. 
    for (Flight flight : flights) 
    { 
        airlineSet.add(flight.getAirline());
        airlineSet.add(flight.getAirline());
    }
    return new ArrayList<>(airlineSet);
}


public static int getTotalFlightsFromAirport( ArrayList<Flight> flights, ArrayList<String> originAirports)
{
   ArrayList<Flight> FlightsFromAirport = query.getFlightsAssociatedWithOriginAirport(flights, originAirports);
   int count = FlightsFromAirport.size();
   return count;
}

public static int getTotalFlightsFromCity( ArrayList<Flight> flights, ArrayList<String> originCities )
{
   ArrayList<Flight> FlightsFromCity = query.getFlightsAssociatedWithOriginCity (flights, originCities);
   int count = FlightsFromCity.size();
   return count;
}

public static int getTotalFlightsFromState( ArrayList<Flight> flights, ArrayList<String> originStates )
{
   ArrayList<Flight> FlightsFromState = query.getFlightsAssociatedWithOriginState (flights, originStates);
   int count = FlightsFromState.size();
   return count;
}

public static int getTotalFlightsFromAirline( ArrayList<Flight> flights, ArrayList<String> airlines)
{
   ArrayList<Flight> FlightsFromAirline = query.getFlightsAssociatedWithAirline(flights, airlines);
   int count = FlightsFromAirline.size();
   return count;
}

public static ArrayList<ArrayList<String>> airportsSortedByMostOutgoingFlights (ArrayList<Flight> flights)
{
    ArrayList<String> airportsInArrayList =  getAllAirports(flights);
    ArrayList<ArrayList<String>> airportFlights = new ArrayList<>(); //2d arrayList/ arrayList of arrayList of strings (column 0 stores airport, column 1 total flights as string)
    for ( int i =0; i < airportsInArrayList.size(); i++)
    {
      String airport = airportsInArrayList.get(i);
      ArrayList<String> airportInfo = new ArrayList<>();
      airportInfo.add(airport); // Add airport name
      airportInfo.add(Integer.toString(getTotalFlightsFromAirport(flights, airportInfo))); 
      airportFlights.add(airportInfo);
    }
    Collections.sort(airportFlights, new Comparator<ArrayList<String>>() 
    {
      public int compare(ArrayList<String> airport1, ArrayList<String> airport2) 
      {
        int totalFlights1 = Integer.parseInt(airport1.get(1));
        int totalFlights2 = Integer.parseInt(airport2.get(1));
        return Integer.compare(totalFlights2, totalFlights1); 
      } 
    });
    //test to show it works
    /*for (ArrayList<String> airportInfo : airportFlights) 
    {
        System.out.println("Airport: " + airportInfo.get(0) + ", Total Flights: " + airportInfo.get(1));
    }
    */
   return airportFlights;
}

public static ArrayList<ArrayList<String>> airlinesSortedByMostOutgoingFlights (ArrayList<Flight> flights)
{
    ArrayList<String> airlinesInArrayList =  getAllAirlines(flights);
    ArrayList<ArrayList<String>> airlineFlights = new ArrayList<>(); //2d arrayList/ arrayList of arrayList of strings (column 0 stores airport, column 1 total flights as string)
    for ( int i =0; i < airlinesInArrayList.size(); i++)
    {
      String airline = airlinesInArrayList.get(i);
      ArrayList<String> airlineInfo = new ArrayList<>();
      airlineInfo.add(airline); // Add airport name
      airlineInfo.add(Integer.toString(getTotalFlightsFromAirline(flights, airlineInfo))); 
      airlineFlights.add(airlineInfo);
    }
    Collections.sort(airlineFlights, new Comparator<ArrayList<String>>() 
    {
      public int compare(ArrayList<String> airline1, ArrayList<String> airline2) 
      {
        int totalFlights1 = Integer.parseInt(airline1.get(1));
        int totalFlights2 = Integer.parseInt(airline2.get(1));
        return Integer.compare(totalFlights2, totalFlights1); 
      } 
    });
    //test to show it works
   /* for (ArrayList<String> airlineInfo : airlineFlights) 
    {
        System.out.println("Airline: " + airlineInfo.get(0) + ", Total Flights: " + airlineInfo.get(1));
    }*/
    
   return airlineFlights;
}

 public static ArrayList<Flight> getFlightsAssociatedWithOrState(ArrayList<Flight> flights, String state) //jake
    {
        String compState;
       
        ArrayList<Flight> stateFlights = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
         
            compState = flights.get(i).originState;
           
            if ( state.equals(compState) )
            {
             // println( flightAirport );
              stateFlights.add(flights.get(i));
            }
        }
        return stateFlights;
    }
   
    public static ArrayList<Flight> getFlightsAssociatedWithDestState(ArrayList<Flight> flights, String state) //jake
    {
        String compState;
       
        ArrayList<Flight> stateFlights = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList
        {
         
            compState = flights.get(i).destinationState;
           
            if ( state.equals(compState) )
            {
             // println( flightAirport );
              stateFlights.add(flights.get(i));
            }
         
 
        }
        return stateFlights;
    }
   
    public static ArrayList<ArrayList<String>> busiestAirportsInSet (ArrayList<Flight> flights)
{
    ArrayList<String> airportsInArrayList =  getAllAirports(flights);
    ArrayList<ArrayList<String>> airportFlights = new ArrayList<>(); //2d arrayList/ arrayList of arrayList of strings (column 0 stores airport, column 1 total flights as string)
    for ( int i =0; i < airportsInArrayList.size(); i++)
    {
      String airport = airportsInArrayList.get(i);
      ArrayList<String> airportInfo = new ArrayList<>();
      airportInfo.add(airport); // Add airport name
      airportInfo.add(Integer.toString(getTotalFlightsFromAirport(flights, airportInfo)));
      airportFlights.add(airportInfo);
    }
    Collections.sort(airportFlights, new Comparator<ArrayList<String>>()
    {
      public int compare(ArrayList<String> airport1, ArrayList<String> airport2)
      {
        int totalFlights1 = Integer.parseInt(airport1.get(1));
        int totalFlights2 = Integer.parseInt(airport2.get(1));
        return Integer.compare(totalFlights2, totalFlights1);
      }
    });
    //test to show it works
    for (ArrayList<String> airportInfo : airportFlights)
    {
        System.out.println("Airport: " + airportInfo.get(0) + ", Total Flights: " + airportInfo.get(1));
    }
   return airportFlights;
}

public static ArrayList<ArrayList<String>> busiestStatesInSet (ArrayList<Flight> flights) //jake
{
    ArrayList<String> statesInArrayList =  getAllStates(flights);
    ArrayList<ArrayList<String>> stateFlights = new ArrayList<>();
    for ( int i =0; i < statesInArrayList.size(); i++)
    {
      String state = statesInArrayList.get(i);
      ArrayList<String> stateInfo = new ArrayList<>();
      stateInfo.add(state); // Add airport name
      stateInfo.add(Integer.toString(getTotalFlightsFromState(flights, stateInfo)));
      stateFlights.add(stateInfo);
    }
    Collections.sort(stateFlights, new Comparator<ArrayList<String>>()
    {
      public int compare(ArrayList<String> state1, ArrayList<String> state2)
      {
        int totalFlights1 = Integer.parseInt(state1.get(1));
        int totalFlights2 = Integer.parseInt(state2.get(1));
        return Integer.compare(totalFlights2, totalFlights1);
      }
    });
    //test to show it works
    for (ArrayList<String> stateInfo : stateFlights)
    {
        System.out.println("State: " + stateInfo.get(0) + ", Total Flights: " + stateInfo.get(1));
    }
   return stateFlights;
}
public static ArrayList<String> getCitiesFromState (ArrayList<Flight> flights, String state) //jake
{
  Set<String> cities = new HashSet<>();
  String compState;
  for (int i = 0; i < flights.size(); i++)
        {          
            compState = flights.get(i).originState;        
            if ( state.equals(compState) )
            {
             // println( flightAirport );
              cities.add(flights.get(i).originCity);
            }
        }
        for (int i = 0; i < flights.size(); i++)
        {          
            compState = flights.get(i).destinationState;        
            if ( state.equals(compState) )
            {
             // println( flightAirport );
              cities.add(flights.get(i).destinationCity);
            }
        }  
  return new ArrayList<>(cities);
}

public static ArrayList<String> getAirportsFromState (ArrayList<Flight> flights, String state) //jake
{
  Set<String> airports = new HashSet<>();
  String compState;
  for (int i = 0; i < flights.size(); i++)
        {          
            compState = flights.get(i).originState;        
            if ( state.equals(compState) )
            {
             // println( flightAirport );
              airports.add(flights.get(i).originAirport);
            }
        }
        for (int i = 0; i < flights.size(); i++)
        {          
            compState = flights.get(i).destinationState;        
            if ( state.equals(compState) )
            {
             // println( flightAirport );
              airports.add(flights.get(i).destinationAirport);
            }
        }  
  return new ArrayList<>(airports);
}
   
public static ArrayList<String> getAirlinesFromAirport (ArrayList<Flight> flights, String airport) //jake
{
  Set<String> airlines = new HashSet<>();
  String compAirport;
  for (int i = 0; i < flights.size(); i++)
        {          
            compAirport = flights.get(i).originAirport;        
            if ( airport.equals(compAirport) )
            {
             
              airlines.add(flights.get(i).airline);
            }
        }
        for (int i = 0; i < flights.size(); i++)
        {          
            compAirport = flights.get(i).destinationAirport;        
            if ( airport.equals(compAirport) )
            {
           
              airlines.add(flights.get(i).airline);
            }
        }  
  return new ArrayList<>(airlines);
}

public static ArrayList<ArrayList<String>> citiesSortedByMostOutgoingFlights (ArrayList<Flight> flights)
{
    ArrayList<String> citiesInArrayList =  getAllCities(flights);
    ArrayList<ArrayList<String>> cityFlights = new ArrayList<>(); //2d arrayList/ arrayList of arrayList of strings (column 0 stores airport, column 1 total flights as string)
    for ( int i =0; i < citiesInArrayList.size(); i++)
    {
      String city = citiesInArrayList.get(i);
      ArrayList<String> cityInfo = new ArrayList<>();
      cityInfo.add(city); // Add airport name
      cityInfo.add(Integer.toString(getTotalFlightsFromCity(flights, cityInfo))); 
      cityFlights.add(cityInfo);
    }
    Collections.sort(cityFlights, new Comparator<ArrayList<String>>() 
    {
      public int compare(ArrayList<String> city1, ArrayList<String> city2) 
      {
        int totalFlights1 = Integer.parseInt(city1.get(1));
        int totalFlights2 = Integer.parseInt(city2.get(1));
        return Integer.compare(totalFlights2, totalFlights1); 
      } 
    });
    //test to show it works
    for (ArrayList<String> cityInfo : cityFlights) 
    {
        System.out.println("City: " + cityInfo.get(0) + ", Total Flights: " + cityInfo.get(1));
    }
   return cityFlights;
}


public static ArrayList<Flight> getCommonFlightsInTwoArrayLists(ArrayList<Flight> flights1, ArrayList<Flight> flights2) 
{
    ArrayList<Flight> commonFlights = new ArrayList<>();
    for (int i = 0; i < flights1.size(); i++) 
    {
        Flight flight1 = flights1.get(i);
        for (int j = 0; j < flights2.size(); j++) 
        {
            Flight flight2 = flights2.get(j);
            if (flight1.equals(flight2)) 
            {
                commonFlights.add(flight1);
                j+= flights2.size();  // This is to break out of the second for loop as there is no point in keep searching after common flight is found
            }
        }
    }
    return commonFlights;
}

public static ArrayList<Flight> sortQuickestFlights(ArrayList<Flight> flights) 
{
    ArrayList<Flight> quickestFlights = new ArrayList<>();
    for (int i = 0; i < flights.size(); i++) 
    {
      if ( flights.get(i).isCancelled != 1)
      {
        Flight flight = flights.get(i);
        quickestFlights.add(flight);
      }
    }
    Collections.sort(quickestFlights, new Comparator<Flight>() 
    {
        public int compare(Flight flight1, Flight flight2) 
        {
            return Integer.compare( flight2.actualTimeTaken, flight1.actualTimeTaken);  
        }
    });
    return quickestFlights;
}

public static ArrayList<Flight> getQuickestRouteBetweenAirportsWithinTimeRange (ArrayList<Flight> flights, ArrayList<String> originAirports, ArrayList<String> destinationAirports, int minTime, int maxTime)
{
  ArrayList<Flight> originalAirports = getFlightsAssociatedWithOriginAirport(flights, originAirports);
  ArrayList<Flight> routes = getFlightsAssociatedWithDestAirport(originalAirports, destinationAirports);
  ArrayList<Flight> quickestRoutes = getQuickestFlightsWithinRange( routes , minTime, maxTime);
  return quickestRoutes;
}

public static ArrayList<Flight> getFirstFlightsScheduledBetweenAirports (ArrayList<Flight> flights)
{
   ArrayList<Flight> firstFlights = new ArrayList<>();
    for (int i = 0; i < flights.size(); i++) 
    {
      if ( flights.get(i).isCancelled != 1)
      {
        Flight flight = flights.get(i);
        firstFlights.add(flight);
      }
    }
    Collections.sort(firstFlights, new Comparator<Flight>() 
    {
        public int compare(Flight flight1, Flight flight2) 
        {
            if (flight2.flightDay != flight1.flightDay)
            {
            return Integer.compare( flight1.flightDay, flight2.flightDay);
            }
            else
            {
            return Integer.compare( flight1.scheduledDeparture, flight2.scheduledDeparture);  
            }
        }
    });
    return firstFlights;
}

public static ArrayList<Flight> getQuickestFlightsWithinRange(ArrayList<Flight> flights, int minTime, int maxTime) 
{
    ArrayList<Flight> FlightsWithinRange = new ArrayList<>();
    for (int i = 0; i < flights.size(); i++) 
    {
      Flight flight = flights.get(i);
    if ( flights.get(i).actualTimeTaken >= minTime && flights.get(i).actualTimeTaken <= maxTime 
    && flights.get(i).isCancelled == 0)
      {
        FlightsWithinRange.add(flight);
      }
    }
   ArrayList<Flight> Flights = sortQuickestFlights(FlightsWithinRange);
   return Flights;
}
    




public static ArrayList<Flight> getFlightsSortedByLateness(ArrayList<Flight> flights) 
{
    ArrayList<Flight> lateFlights = new ArrayList<>();
    for (int i = 0; i < flights.size(); i++) 
    {
        Flight flight = flights.get(i);
        if (flights.get(i).lateness > 0) 
        {
          lateFlights.add(flight);
        }
    }
    Collections.sort(lateFlights, new Comparator<Flight>() 
    {
        public int compare(Flight flight1, Flight flight2) 
        {
          // currently sorts from most late to least late. Switching to "return Integer.compare( flight1.lateness, flight2.lateness)"
          // will sort from least late to most late
            return Integer.compare( flight2.lateness, flight1.lateness);  
        }
    });
    return lateFlights;
}

public static ArrayList<Flight> getFlightsSortedByLatestArrival(ArrayList<Flight> flights) 
{
    ArrayList<Flight> lateFlights = new ArrayList<>();
    for (int i = 0; i < flights.size(); i++) 
    {
        Flight flight = flights.get(i);
        if (flights.get(i).arrivalLateness > 0) 
        {
          lateFlights.add(flight);
        }
    }
    Collections.sort(lateFlights, new Comparator<Flight>() 
    {
        public int compare(Flight flight1, Flight flight2) 
        {
          // currently sorts from most late to least late. Switching to "return Integer.compare( flight1.lateness, flight2.lateness)"
          // will sort from least late to most late
            return Integer.compare( flight2.arrivalLateness, flight1.arrivalLateness);  
        }
    });
    return lateFlights;
}



public static ArrayList<Flight> getFlightsSortedByEarliness(ArrayList<Flight> flights) 
{
    ArrayList<Flight> earlyFlights = new ArrayList<>();
    for (int i = 0; i < flights.size(); i++) 
    {
        Flight flight = flights.get(i);
        if (flights.get(i).earliness > 0) 
        {
          earlyFlights.add(flight);
        }
    }
    Collections.sort(earlyFlights, new Comparator<Flight>() 
    {
        public int compare(Flight flight1, Flight flight2) 
        {
          // currently sorts from most early to least early. Switching to "return Integer.compare( flight1.lateness, flight2.lateness)"
          // will sort from least early to most early
            return Integer.compare( flight2.earliness, flight1.earliness);  
        }
    });
    return earlyFlights;
}

public static ArrayList<Flight> getFlightsSortedByEarliestArrival(ArrayList<Flight> flights) 
{
    ArrayList<Flight> earlyFlights = new ArrayList<>();
    for (int i = 0; i < flights.size(); i++) 
    {
        Flight flight = flights.get(i);
        if (flights.get(i).arrivalEarliness > 0) 
        {
          earlyFlights.add(flight);
        }
    }
    Collections.sort(earlyFlights, new Comparator<Flight>() 
    {
        public int compare(Flight flight1, Flight flight2) 
        {
          // currently sorts from most early to least early. Switching to "return Integer.compare( flight1.lateness, flight2.lateness)"
          // will sort from least early to most early
            return Integer.compare( flight2.arrivalEarliness, flight1.arrivalEarliness);  
        }
    });
    return earlyFlights;
}


public static ArrayList<Flight> sortFlightsByScheduledDeparture(ArrayList<Flight> flights)
{
    Collections.sort(flights, new Comparator<Flight>() 
    {
        public int compare(Flight flight1, Flight flight2) 
        {
          // currently sorts from most early to least early. Switching to "return Integer.compare( flight1.lateness, flight2.lateness)"
          // will sort from least early to most early
            return Integer.compare( flight1.scheduledDeparture, flight2.scheduledDeparture);  
        }
    });
    return flights;
}

public static ArrayList<Flight> sortFlightsByActualArrival(ArrayList<Flight> flights)
{
    Collections.sort(flights, new Comparator<Flight>() 
    {
        public int compare(Flight flight1, Flight flight2) 
        {
          // currently sorts from most early to least early. Switching to "return Integer.compare( flight1.lateness, flight2.lateness)"
          // will sort from least early to most early
            return Integer.compare(flight1.getActualArrival(), flight2.getActualArrival());  
        }
    });
    return flights;
}



public static ArrayList<Flight> getRoutes(ArrayList<Flight> originAirports, ArrayList<Flight> destinationAirports) 
{
  ArrayList<Flight> commonFlights = query.getCommonFlightsInTwoArrayLists(originAirports, destinationAirports);
  return commonFlights;
}

public static int properTimeTaken(int departure, int arrival)
{
  if (arrival < departure)
  {
    arrival += 2400;
  }
  return arrival - departure;
}
}

 
