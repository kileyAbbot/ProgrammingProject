
/*
Still a work in progress will work on this more just figured i'd comment it out
 
 To do/things to be included in this:
 create list of departure flights
 create list of arrival flights
 incorporate some kind of statistic/description of late arrivals in comparison to other airports (lateness on departure is what is necessary for late statistics)
 */
String airportName;
Flight[] departingFlightsArray;
ArrayList<Flight> arrivalFlights = new ArrayList<Flight>();
ArrayList<Flight> departingFlights = new ArrayList<Flight>();
PImage airportPhoto;
PFont headerFont;

  Airport(String departureAirport) //revert back to flight
  {
    airportName = departureAirport.getOriginAirport();
    airportName = departureAirport;//add .getOriginAirport()
    ArrayList<Flight> departingFlights = getFlightsAssociatedWithOriginAirport(flightsInfo, airportName);
    ArrayList<Flight> arrivalFlights = getFlightsAssociatedWithOriginAirport(flightsInfo, airportName);

    //place to load in value for airportPhoto (big airports have their own photo, small airports share generic)
    airportPhoto = loadImage("pixelatedDulles.png");
    airportPhoto.resize(1280, 800);
  }
  
  void draw()
  {
    headerFont = loadFont("HelveticaNeue-Thin-48.vlw");
    textFont(headerFont, 48);
    
    fill(#FFFCE9);
    image(airportPhoto, 0, 0);
    text(airportName, 370, 50);
    
    //DepartureBoard
    color boardColor = get(100, 200);
    fill(boardColor, 200);
     
    rect(10, 300, 630, 325);
    rect(640, 300, 630, 325);
    
    
    
  }
  
  
  
  
  
 
 //   departingFlights = getFlightsAssociatedWithOriginAirport
    
  
