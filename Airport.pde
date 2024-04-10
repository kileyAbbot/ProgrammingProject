/*
IMPORTANT TO NOTE:
to get to airport screen you have to type a three-digit airport code (I use JFK and DCA to test)
so do something like JFK and hit enter and it should come up with the related screen.

To add/fix/change:
- where the int YVal is instantiated: make sure that if it overlaps it can go over to a new row, so if it crosses the screen size, it continues in a new column
- updating search bar to make it more visually appealing, size can best be fixed using the W, H, Y, and Z, as well as the TEXTBOX draw method
- make buttons functional
*/
String airportName;                          
Flight[] departingFlightsArray;
ArrayList<Flight> arrivalFlights;
ArrayList<Flight> departingFlights;
PImage airportPhoto;
PFont headerFont;
ArrayList<Flight> flightList = returnFlightArray();


Airport currAirport;
public TEXTBOX airportSearchBar = new TEXTBOX();
public boolean isComplete = false;
public String msg = "";
public boolean isPressed = false;
String cityFromTable;


int airportDeparturePage = 0;
int airportArrivalPage = 0;
/* Airport class: Used to generate basic information regarding airports, and display it visually onto its own page. Also implements
search bar tool to filter by airports and display visually. */
class Airport
{
  Airport(String departureAirport) 
  {
    airportName = departureAirport;    //Airport name is set based on departure, also captures arrivals
    //place to load in value for airportPhoto (big airports have their own photo, small airports share generic)
    airportPhoto = loadImage("pixelatedDulles.png");                                                                //stock photo of airport in Data file
    //airportPhoto.resize(1280, 800);                                                                                 resizable to the screen if necessary
  }
  
  String getName()                                                                                                  //returns airport name
  {
    return airportName;
  }

  ArrayList<Flight> returnDepartingFlights()                                                                        //returns arrayList of departing flights given an airport  
  {
  return departingFlights; 
  }
  
  ArrayList<Flight> returnArrivingFlights()                                                                         //returns arrayList of arrival flights given an airport  
  {
    return arrivalFlights;
  }
}



/* drawSearch method: the first step in the two-part airport generation process. It shows search bar where a user can enter input and generates a list of airports that match the criteria.
Also differentiates between airports in cities where two or more airports are present.
*/
  void drawSearch()                                                                                                   
  {                      
      //Generates font used for search (updateable if necessary)
      headerFont = loadFont("HelveticaNeue-Thin-48.vlw");                    
      textFont(headerFont, 48);            
      
      
      //draws the airport search bar at the given coordinates, W = width, H = height, x = starting X position, Y = starting y-position
      //Changeable if necessary
      airportSearchBar.W = 150;
      airportSearchBar.H = 35;
      airportSearchBar.X = (width - 100) / 2;
      airportSearchBar.Y = 50;
    
      //uses draw method in TEXTBOX to generate the textbox. If making style changes they can best be updated under this method in the TEXTBOX class
      airportSearchBar.DRAW();
  
      //Generates arraylists for both cities and airport codes
      ArrayList<String> cities = new ArrayList<>();
      ArrayList<String> airportCodes = new ArrayList<>();
    
      //Creates an arrayList for valid cities and airport combinations given that each city is included, if a city has more than one airport, all airports can be seen
      for(int i = 0; i < flightsInfo.size(); i++)
      {
      String cityName = flightsInfo.get(i).getDestinationCity();
      String cityAirportCode = flightsInfo.get(i).getDestinationAirport();
        
      if(!cities.contains(cityName) && !airportCodes.contains(cityAirportCode))
      {
        airportCodes.add(cityAirportCode);
        cities.add(cityName + " (" + cityAirportCode + ")" );
      }
   }  
    
      //generate list of cities by taking the String generated in the search bar
      String search = airportSearchBar.Text;

      ArrayList<String> validCityNames = new ArrayList<String>();          //array for valid city names given modified text 
   
      int yVal = 200;              //starting Y-value (change if necessary)                                    
         
      //filters city list (ignoring case) dependent on user input (aka. Ho --> Houston, Honolulu; Hon --> Honolulu (Houston is no longer visible)    
      for(int i = 0; i < cities.size(); i++)
      {
        cityFromTable = cities.get(i).toLowerCase();
        if(cityFromTable.startsWith(search.toLowerCase()))
        {
          validCityNames.add(cities.get(i));
        }
      }
      //Print list of valid cities and update based on new key pressed
      for(int i = 0; i < validCityNames.size(); i++)
      {
        text(validCityNames.get(i), 50, yVal); 
        yVal = yVal + 100;
      }
   
   
     //IMPORTANT FIX!!//
     /*Have users click on airport instead of using the enter key to generate airport*/
   
      if(isComplete == true)
      {
        currAirport = new Airport(msg);      //displays airport data when the text is clicked
        drawAirportScreen();                 //draws airport screen visual
      }
    
  }

   void drawAirportScreen()
   {
       
     
     
        Airport mainAirport = new Airport(msg);
        clear();
  
        headerFont = loadFont("HelveticaNeue-Thin-48.vlw");
        textFont(headerFont, 48);
    
        //generates background photo and title
        fill(#FFFCE9);                
        image(airportPhoto, 0, 0);
        text(airportName, 370, 50);
    
        //Design for departure board
        color boardColor = get(100, 200);
        fill(boardColor, 200);
         
        stroke(#eae8eb);
        rect(10, 300, 630, 330);
        rect(640, 300, 630, 330);
        fill(#64a4cc);
        rect(10, 300, 1260, 33);
        
        //generates chart to display departure/arrival board, increments along the y-axis for every 9 entries, then continues onto another page
        int yIncrement = 300;
        for(int lineCount = 10; lineCount > 0; lineCount--)
        {
          yIncrement = yIncrement + 33;
          line(10, yIncrement, 1270, yIncrement);
        }
        
        textSize(16);
        Button nextDepartures = new Button("Next", 250, 250, 50, 50);
        Button nextArrivals = new Button("Next", 800, 250, 50, 50);
        Button backDepartures = new Button("Back", 300, 250, 50, 50);
        Button backArrivals = new Button("Back", 850, 250, 50, 50);
        
        nextDepartures.airportDisplay();
        nextArrivals.airportDisplay();
        if(airportDeparturePage != 0)
        {
          backDepartures.airportDisplay();
        }
        if(airportArrivalPage != 0)
        {
          backArrivals.airportDisplay();
        }
        
        
        //Headers for departure/arrival board, may have to be moved, size updated, and/or font updated.
        PFont mainFont = loadFont("HelveticaNeue-Light-48.vlw");
        textFont(mainFont, 18);
        fill(#eae8eb);
        text("Departure Time", 15, 325); 
        text("Arrival (Scheduled)", 150, 325);
        text("Destination City", 400, 325);
        text("Airline", 570, 325);
    
    
        text("Arrival Time", 655, 325);
        text("Status", 805, 325);
        text("Arriving From", 1010, 325);
        text("Airline", 1175, 325);
    
        //find departing flights by using queries with their method headers below (bodies found in Query class)
        //public static ArrayList<Flight> getFlightsAssociatedWithOriginAirport(ArrayList<Flight> flights, ArrayList<String> originAirports)
        //public static ArrayList<Flight> getFlightsAssociatedWithDestAirport(ArrayList<Flight> flights, ArrayList<String> destinationAirports
        ArrayList<Flight> departures = new ArrayList<Flight>();
        ArrayList<Flight> arrivals = new ArrayList<Flight>();
        ArrayList<String> givenAirportName = new ArrayList<String>();
        givenAirportName.add(mainAirport.getName());
        departures = query.getFlightsAssociatedWithOriginAirport(flightsInfo, givenAirportName);
        arrivals =  query.getFlightsAssociatedWithDestAirport(flightsInfo, givenAirportName);
        
        //public static ArrayList<Flight> getFlightsWithinDateRange(ArrayList<Flight> flights, int startDate, int endDate)
        departures = query.getFlightsOnSpecificDate(departures, 1, 2);
        arrivals = query.getFlightsOnSpecificDate(arrivals, 1, 2);
    
        ArrayList<Flight> cancelledDepartures = new ArrayList<Flight>();
        for(int i = 0; i < departures.size(); i++)
        {
          if(departures.get(i).getIsCancelled() == 1)
          {
            cancelledDepartures.add(departures.get(i));
            departures.remove(i);
          }
        }
        
        ArrayList<Flight> cancelledArrivals = new ArrayList<Flight>();
        for(int i = 0; i < arrivals.size(); i++)
        {
          if(arrivals.get(i).getIsCancelled() == 1)
          {
            cancelledArrivals.add(arrivals.get(i));
            arrivals.remove(i);
          }
        }
        
        departures = query.sortFlightsByScheduledDeparture(departures);
        arrivals = query.sortFlightsByActualArrival(arrivals);
        
        departures.addAll(cancelledDepartures);
        arrivals.addAll(cancelledArrivals);        
            
        //Display time, airline, and other key data related to the departures/arrivals
        int hour;
        String minutes;
        
        //displays hour of departure (stylized), 24h time
        String destinationCity = "";
        String airline = "";
        int yVal = 358;
        int yValArrivals = 358;
        int yValDestination = 358;
        int yValAirline = 358;
        for(int i = 0; i < departures.size(); i++)
        {
            if(nextDepartures.isClicked(mouseX, mouseY))
            {
              i = i + 8;
              airportDeparturePage++;
          }  
          else if (backDepartures.isClicked(mouseX, mouseY))
          {
            airportDeparturePage--;
            if(i - 8 < 0)
            {
              i = 0;
            }
            else
            {
              i = i - 8;
            }
            if(airportDeparturePage  < 0)
            {
              airportDeparturePage = 0;
            }
          }
              Flight currFlight = departures.get(i);
              hour = currFlight.getScheduledDepartureHour();
              minutes = currFlight.getScheduledDepartureMinute();
              text(hour + ":" + minutes, 30, yVal);
              yVal = yVal + 33;
            
             //displays hour and minute of (scheduled) arrival at destination (stylized)
              
              hour = currFlight.getActualArrivalHour();
              minutes = currFlight.getActualArrivalMinute();
              text(hour + ":" + minutes, 150, yValArrivals);
              yValArrivals = yValArrivals + 33;
            
            
              destinationCity = currFlight.getDestinationCity();
              text(destinationCity, 400, yValDestination);
              yValDestination = yValDestination + 33;
                
              airline = currFlight.getAirline();
              text(airline, 580, yVal);
              yValAirline = yValAirline + 33;
           
          }


    
        //displays arrival (origin airport) stylized
        yVal = 358;
        for(int i = 0; i < arrivals.size(); i++)
        {
          if(i < 9)
          {
            Flight currFlight = arrivals.get(i);
            if(currFlight.getIsCancelled() == 0)
            {
              hour = currFlight.getActualArrivalHour();
              minutes = currFlight.getActualArrivalMinute();
              text(hour + ":" + minutes, 655, yVal);
              yVal = yVal + 33;
            }
            else
            {
              text("Cancelled", 655, yVal);
              yVal = yVal + 33;
            }
          }
        }
        
        //displays status (canceled, diverted) and shows as a value (not true/false)
        String status = "";
        yVal = 358;
        for(int i = 0; i < arrivals.size(); i++)
        {
          if(i < 9)
          {
            Flight currFlight = arrivals.get(i);
            boolean flightCancelled = currFlight.flightCancelled();
            boolean flightDiverted = currFlight.flightDiverted();
            if(flightCancelled == true)
            {
              status = "Cancelled";
            }
            else if(flightDiverted == true)
            {
              status = "Diverted";
            }
            else
            {
              status = "No changes";
            }
            text(status, 805, yVal);
            yVal = yVal + 33;
          }
        }
    
        //displays the city the plane is arriving from
        String arrivalFromCity = "";
        yVal = 358;
        for(int i = 0; i < arrivals.size(); i++)
        {
          if(i < 9)
          {
            Flight currFlight = arrivals.get(i);
            arrivalFromCity = currFlight.getOriginCity();
            text(arrivalFromCity, 1010, yVal);
            yVal = yVal + 33;
          }
        }
    
        //displays airline (abbreviated, may be better as full)
        yVal = 358;
        String arrivalsAirline = "";
        for(int i = 0; i < arrivals.size(); i++)
        {
          if(i < 9)
          {
            Flight currFlight = arrivals.get(i);
            airline = currFlight.getAirline();
             text(airline, 1185, yVal);
            yVal = yVal + 33;
          }
        }
    
    
        //data to display above arrivals/departures
        //ideas: delays/cancellation rate for departures, airlines by timeliness, lateness at different periods of day (06H - 12H, 12H-18H, 18H-24H, 0H-6H)
        int countOfDelays = 0;
        int countOfCancellations = 0;
        
        //do airline-based cancellations
        //displays percentage of flights from this airport that are considered cancelled and/or diverted
        for(int i = 0; i < departures.size(); i++)
        {
          Flight currFlight = departures.get(i);
          if(currFlight.flightCancelled())
          {
            countOfCancellations = countOfCancellations + 1;
          }
          if(currFlight.getScheduledDeparture() < currFlight.getActualDeparture())
          {
            countOfDelays++;
          }
        }
        
        //text for displaying these statistics
        text("Number of delays this year at " + currAirport.getName() + ": " + countOfDelays, 15, 100);
        text("Number of cancellations this year at  " + currAirport.getName() + ": " + countOfCancellations, 15, 200);

  }

     
  //if enter key is hit, airport data will display (fix this to be based on clicking on the correct airport)     
  void isPressedForTextBox()
  {
     if(airportSearchBar.KEYPRESSED(key, keyCode) == true)
     {
       msg = airportSearchBar.Text;
       isComplete = true;
     }
     else
     {
       msg = airportSearchBar.Text;
     } 
  }

    
  
