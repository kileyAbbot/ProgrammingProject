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
     
         public  static ArrayList<Flight> getFlightsWithinDistanceRange( ArrayList<Flight> flights, int bracketLowerEnd, int bracketUpperEnd )
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

public static int getTotalFlightsFromAirport( ArrayList<Flight> flights, ArrayList<String> originAirports)
{
   ArrayList<Flight> FlightsFromAirport = query.getFlightsAssociatedWithOriginAirport(flights, originAirports);
   int count = FlightsFromAirport.size();
   return count;
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
