
    public static ArrayList<Flight> getFlightsWithinDateRange(ArrayList<Flight> flights, String startDate, String endDate) 
    {
        ArrayList<Flight> flightsWithinDateRange = new ArrayList<>();   //initilizes array list
        for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList 
        {
            Flight flight = flights.get(i);
            if (flight.date.compareTo(startDate) >= 0 && flight.date.compareTo(endDate) <= 0) // compares dates lexicographically (meaning by their characters to determine which string represents a numerically larger or smaller value
            {
                flightsWithinDateRange.add(flight);
            }
        }
        return flightsWithinDateRange;
    }

   
    public static ArrayList<Flight> getFlightsAssociatedWithOriginAirport(ArrayList<Flight> flights, String originAirport) 
    {
        ArrayList<Flight> flightsAssociatedWithAirport = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList 
        {
            Flight flight = flights.get(i);
            if (flight.originAirport.equals(originAirport) ) 
            {
                flightsAssociatedWithAirport.add(flight);
            }
        }
        return flightsAssociatedWithAirport;
    }
    
       public static ArrayList<Flight> getFlightsSortedByLateness(ArrayList<Flight> flights,  int scheduledArrival, int actualArrival) 
    {
        ArrayList<Flight> lateFlights = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList 
        {
            Flight flight = flights.get(i);
            int lateness = actualArrival - scheduledArrival;
            if (lateness > 0)
            {
              flight.setLateness(lateness);
              lateFlights.add(flight);            
              Collections.sort(lateflights, new Comparator<Flight>()        //site I found useful for understanding how to sort objects: https://stackoverflow.com/questions/18895915/how-to-sort-an-array-of-objects-in-java
              {
                public int compare (FLight flight1, Flight flight2)
                {
                  return Integer.compare(flight1.getLateness(), flight2.getLateness());
                }
              }); // ); to close the Collections.sort method
        }
        return lateFlights;
    }
    }
            
        public static ArrayList<Flight> getFlightsSortedByEarliness(ArrayList<Flight> flights,  int scheduledArrival, int actualArrival) 
    {
        ArrayList<Flight> earlyFlights = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList 
        {
            Flight flight = flights.get(i);
            int earliness = scheduledArrival - actualArrival;
            if (earliness > 0)
            {
               flight.setEarliness(earliness);
               earlyFlights.add(flight);            
               Collections.sort(earlyflights, new Comparator<Flight>()        
              {
                public int compare (FLight flight1, Flight flight2)
                {
                  return Integer.compare(flight1.getEarliness(), flight2.getEarliness());
                }
              }); // ); to close the Collections.sort method
        }
        return earlyFlights;
    }
   
