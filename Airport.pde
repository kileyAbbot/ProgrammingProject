/*
Still a work in progress will work on this more just figured i'd comment it out

To do/things to be included in this:
create list of departure flights
create list of arrival flights
incorporate some kind of statistic/description of late arrivals in comparison to other airports (lateness on departure is what is necessary for late statistics)
class Airport
{
  String airportName;
  Flight[] departingFlightsArray; 
  ArrayList<Flight> arrivalFlights = new ArrayList<Flight>();
  //retrive departing flights
  ArrayList<Flight> departingFlights = getFlightsAssociatedWithOriginAirport(totalFlights, airportName);
  

  Airport(Flight departureAirport)
  {
    airportName = departureAirport.getOriginAirport();
  }

  //Flight basic info: Date, destination city, departure time, arrival time airline 
  ArrayList<String> destinationCity = new ArrayList<String>();
  for(int i = 0; i < departingFlights.length(); i++)
  {
    
  }
  
  
  
  
  
 
 //   departingFlights = getFlightsAssociatedWithOriginAirport
    
  }
  
  */
