
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
              lateFlights.add(flight);             //doesn't actually sort by lateness yet, just identifies if flight is early
            }
        }
        return lateFlights;
    }
            
        public static ArrayList<Flight> getFlightsSortedByEarliness(ArrayList<Flight> flights,  int scheduledArrival, int actualArrival) 
    {
        ArrayList<Flight> earlyFlights = new ArrayList<>();
         for (int i = 0; i < flights.size(); i++) //iterates over each element in the flights ArrayList 
        {
            Flight flight = flights.get(i);
            int earliness = scheduledArrival > actualArrival;
            if ( earliness > 0)
            {
              earlyFlights.add(flight);             //doesn't actually sort by earliness yet, just identifies if flight is early
            }
        }
        return earlyFlights;
    }
            
