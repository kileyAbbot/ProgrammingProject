/*
IMPORTANT TO NOTE:
to get to airport screen you have to type a three-digit airport code (I use JFK and DCA to test)
so do something like JFK and hit enter and it should come up with the related screen.

To add/fix/change:
- where the int YVal is instantiated: make sure that if it overlaps it can go over to a new row, so if it crosses the screen size, it continues in a new column
- updating search bar to make it more visually appealing, size can best be fixed using the W, H, Y, and Z, as well as the TEXTBOX draw method
- make buttons functional
- ADD A DATE SEARCH!

*/
String airportName;
String completeName;

ArrayList<Flight> arrivalFlights;
ArrayList<Flight> departingFlights;
PImage airportPhoto;
PFont headerFont;
ArrayList<Flight> flightList = flightsInfo;
String cityFromTable;

public String citySelected = "";
public String fullCityString = "";

Airport currAirport;
public TEXTBOX airportSearchBar = new TEXTBOX();
public TEXTBOX airportDay = new TEXTBOX();
public TEXTBOX airportMonth = new TEXTBOX();
public boolean isComplete = false;
public String airportNameFromSearch = "";
public String airportMonthSearch = "";
public String airportDaySearch = "";
public boolean isPressed = false;

boolean isString = false;
int savedCity = 0;

public ArrayList<AirportAvailable> airportsSearched = new ArrayList<AirportAvailable>();

int monthForQuery = 0;
int dayForQuery = 0;
int airportDeparturePage = 0;
int airportArrivalPage = 0;

int xVal = 0;
int yVal = 0;
public boolean airportFound = false;

/* Airport class: Used to generate basic information regarding airports, and display it visually onto its own page. Also implements
search bar tool to filter by airports and display visually. */
class Airport
{
  Airport(String departureAirport, String fullName) 
  {
    airportName = departureAirport;    //Airport name is set based on departure, also captures arrivals
    completeName = fullName;
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
      background(#64a4cc);
      //Generates font used for search (updateable if necessary)
      headerFont = loadFont("HelveticaNeue-Thin-48.vlw");      
      fill(#eae8eb);
      textFont(headerFont, 48);            
      
      
      //draws the airport search bar at the given coordinates, W = width, H = height, x = starting X position, Y = starting y-position
      //Changeable if necessary, 1920, 1080
      
      
     textSize(30);
     fill(#eae8eb);
     
     text("View an airport listed, or start typing for a specific destiniation", width/2, height/20); 
      airportSearchBar.W = 500;
      airportSearchBar.H = 35;
      airportSearchBar.X = (width - 500) / 2;
      airportSearchBar.Y = 100;
    
      //airport day
      textSize(15);
      text("Include a specific date (i.e. 12 March, 12.03)", width/2, (height/20 * 3)); 
      airportDay.W = 100;
      airportDay.H = 25;
      airportDay.X = (width - 225) / 2;
      airportDay.Y = 180;
    
      //airport month
      airportMonth.W = 100;
      airportMonth.H = 25;
      airportMonth.X = (width + 25) / 2;
      airportMonth.Y = 180;
    
      //uses draw method in TEXTBOX to generate the textbox. If making style changes they can best be updated under this method in the TEXTBOX class
      airportSearchBar.DRAW();
      
      airportDay.TEXTSIZE = 20;
      airportMonth.TEXTSIZE = 20;
      airportDay.DRAW();
      airportMonth.DRAW();
      
      
      if(airportMonth.Text.length() == 0)
      {
        textSize(15);
        text("month", airportMonth.X + (airportMonth.W/2), 192);
      }
      if(airportDay.Text.length() == 0)
      {
        textSize(15);
        text("day", airportDay.X + (airportDay.W/2), 192);
      }
      
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
      
      
      //public static ArrayList<ArrayList<String>> busiestAirportsInSet (ArrayList<Flight> flights)      
      yVal = 300;              //starting Y-value (change if necessary)   
      xVal = 600;

      if(airportSearchBar.Text.length() == 0)
      {
        for(int i = 0; i < 12; i++)
        {
          savedCity = i;
          AirportAvailable currentAirport = new AirportAvailable(validCityNames.get(i), xVal, yVal, 180, 70);
          airportsSearched.add(currentAirport);
          currentAirport.display();
          if(xVal < 1100)
          {
            xVal = xVal + 288;
          }
          else
          {
            xVal = 600;
            yVal = yVal+100;
          }
        }
      }
      else
      {
        xVal = 600;
        yVal = 300;
        for(int i = 0; i < validCityNames.size(); i++)
        {
          savedCity = i;
          AirportAvailable currentAirport = new AirportAvailable(validCityNames.get(i), xVal, yVal, 150, 70);
          airportsSearched.add(currentAirport);
          currentAirport.display();
          if(xVal < 1100)
          {
            xVal = xVal + 288;
          }
          else
          {
            xVal = 600;
            yVal = yVal + 100;
          }
        }
      }
      
      // (" + cityAirportCode + ")" 
      //get substring for airport code
      
      if(airportFound == true)
      {
        drawAirportScreen();                 //draws airport screen visual
      }
    
  }



   void drawAirportScreen()
   {
        monthForQuery = testNumericMonth(airportMonth.Text, airportDay.Text);
        if(monthForQuery == 0)
        {
          monthForQuery = decodeMonth(airportMonth.Text);
        }
        if(airportDay.Text != null)
        {
          dayForQuery = Integer.valueOf(airportDay.Text);
        }
        
        
        Airport mainAirport = new Airport(citySelected, fullCityString);
        clear();
  
        headerFont = loadFont("HelveticaNeue-Thin-48.vlw");
        textFont(headerFont, 55);
    
        //generates background photo and title
        fill(#FFFCE9);                
        image(airportPhoto, 0, 0);
        text(completeName, 960, 50);
    
        //Design for departure board
        color boardColor = get(100, 200);
        fill(boardColor, 200);
         
        stroke(#eae8eb);
        rect(96, 360, 864, 680);
        rect(960, 360, 864, 680);
        fill(#64a4cc);
        rect(96, 360, 1728, 68);
        
        //generates chart to display departure/arrival board, increments along the y-axis for every 9 entries, then continues onto another page
        int yIncrement = 360;
        for(int lineCount = 10; lineCount > 0; lineCount--)
        {
          yIncrement = yIncrement + 68;
          line(96, yIncrement, 1824, yIncrement);
        }
        
        textSize(20);


        //Headers for departure/arrival board, may have to be moved, size updated, and/or font updated.
        PFont mainFont = loadFont("HelveticaNeue-Light-48.vlw");
        textFont(mainFont, 25);
        fill(#eae8eb);
        text("Departure Time", 200, 395); 
        text("Arrival (Scheduled)", 420, 395);
        text("Destination City", 680, 395);
        text("Airline", 880, 395);
    
    
        text("Arrival Time", 1050, 395);
        text("Status", 1280, 395);
        text("Arriving From", 1535, 395);
        text("Airline", 1760, 395);
    
        //find departing flights by using queries with their method headers below (bodies found in Query class)
        //public static ArrayList<Flight> getFlightsAssociatedWithOriginAirport(ArrayList<Flight> flights, ArrayList<String> originAirports)
        //public static ArrayList<Flight> getFlightsAssociatedWithDestAirport(ArrayList<Flight> flights, ArrayList<String> destinationAirports
        ArrayList<Flight> departures = new ArrayList<Flight>();
        ArrayList<Flight> arrivals = new ArrayList<Flight>();
        ArrayList<String> givenAirportName = new ArrayList<String>();
        givenAirportName.add(mainAirport.getName());
        departures = query.getFlightsAssociatedWithOriginAirport(flightsInfo, givenAirportName);
        arrivals =  query.getFlightsAssociatedWithDestAirport(flightsInfo, givenAirportName);
        
        //getFlightsOnSpecificDate(ArrayList<Flight> flights, int flightMonth, int flightDay)
        departures = query.getFlightsOnSpecificDate(departures, monthForQuery, dayForQuery);
        arrivals = query.getFlightsOnSpecificDate(arrivals, monthForQuery, dayForQuery);
    
    
        //move cancelled departures to a separate list so they are moved to the end of the list of flights when sorted
        ArrayList<Flight> cancelledDepartures = new ArrayList<Flight>();
        for(int i = 0; i < departures.size(); i++)
        {
          if(departures.get(i).getIsCancelled() == 1)
          {
            cancelledDepartures.add(departures.get(i));
            departures.remove(i);
          }
        }
        
        //move cancelled arrivals to a separate list so they are moved to the end of the list of flights when sorted
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
        int yValDepartTime = 462;
        int yValArrivals = 462;
        int yValDestination = 462;
        int yValAirline = 462;
        
        int countPerPage = 9;
        for(int i = 0; i < departures.size(); i++)
        {
          
             //displays hour and minute of departure (stylized)            
              Flight currFlight = departures.get(i);
              hour = currFlight.getScheduledDepartureHour();
              minutes = currFlight.getScheduledDepartureMinute();
              text(hour + ":" + minutes, 200, yValDepartTime);
              yValDepartTime = yValDepartTime + 68;
            
             //displays hour and minute of (scheduled) arrival at destination (stylized)
              
              if(currFlight.getIsCancelled() == 0)
              {
                hour = currFlight.getActualArrivalHour();
                minutes = currFlight.getActualArrivalMinute();
                text(hour + ":" + minutes, 420, yValArrivals);
              }
              else
              {
                text("Cancelled", 420, yValArrivals);
              }
              yValArrivals = yValArrivals + 68;
            
            
              destinationCity = currFlight.getDestinationCity();
              if(destinationCity.length() > 25)
              {
                textSize(20);
                text(destinationCity, 680, yValDestination);
                textSize(25);
              }
              else
              {
                text(destinationCity, 680, yValDestination);
              }
              yValDestination = yValDestination + 68;
                
              airline = currFlight.getAirline();
              text(airline, 880, yValAirline);
              yValAirline = yValAirline + 68;
             
             countPerPage--;
          }
    
        //displays arrival (origin airport) stylized
        int yValArriveTime = 462;
        int yValStatus = 462;
        int yValArriveFrom = 462;
        int yValAirlineArrivals = 462;
        String status = "";
        String arrivalFromCity = "";
        //replace with arrivals.size()
        for(int i = 0; i < 9; i++)
        {
            Flight currFlight = arrivals.get(i);
            if(currFlight.getIsCancelled() == 0)
            {
              hour = currFlight.getActualArrivalHour();
              minutes = currFlight.getActualArrivalMinute();
              text(hour + ":" + minutes, 1050, yValArriveTime);
              yValArriveTime = yValArriveTime + 68;
            }
            else
            {
              text("Cancelled", 655, yValArriveTime);
              yValArriveTime = yValArriveTime + 68;
            }
            
            //displays status (canceled, diverted) and shows as a value (not true/false)
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
            text(status, 1280, yValStatus);
            yValStatus = yValStatus + 68;
            
            //displays the city the plane is arriving from
            arrivalFromCity = currFlight.getOriginCity();
            text(arrivalFromCity, 1530, yValArriveFrom);
            yValArriveFrom = yValArriveFrom + 68;
            
            //displays airline (abbreviated, may be better as full)
            airline = currFlight.getAirline();
            text(airline, 1760, yValAirlineArrivals);
            yValAirlineArrivals = yValAirlineArrivals + 68;
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
        
        int proportionDelayed = (countOfDelays / departures.size()) * 100;
        int proportionCancelled = (countOfCancellations / arrivals.size()) * 100;
        //text for displaying these statistics
       // text("Number of delays this year at " + mainAirport.getName() + ": " + countOfDelays , 300, 200);
       // text("Number of cancellations this year at  " + mainAirport.getName() + ": " + countOfCancellations, 300, 240);

  }

     
  //if enter key is hit, airport data will display (fix this to be based on clicking on the correct airport)     
 void isPressedForTextBox()
  {
     if(airportSearchBar.KEYPRESSED(key, keyCode) == false && airportDay.KEYPRESSED(key, keyCode) == false && airportMonth.KEYPRESSED(key, keyCode) == false)
     {
       airportNameFromSearch = airportSearchBar.Text;
       airportMonthSearch = airportMonth.Text;
       airportDaySearch = airportDay.Text;  
     }
  }

 int decodeMonth(String airportMonthSearch)
 {
   int month = 0;
   if(airportMonthSearch.toLowerCase().startsWith("jan"))
   {
     month = 1;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("feb"))
   {
     month = 2;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("mar"))
   {
     month = 3;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("apr"))
   {
     month = 4;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("may"))
   {
     month = 5;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("jun"))
   {
     month = 6;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("jul"))
   {
     month = 7;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("aug"))
   {
     month = 8;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("sep"))
   {
     month = 9;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("oct"))
   {
     month = 10;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("nov"))
   {
     month = 11;
   }
   else if(airportMonthSearch.toLowerCase().startsWith("dec"))
   {
     month = 12;
   }
   return month;
 }
 
 int testNumericMonth(String month, String day)
 {
   try
   {
     int monthParsed = Integer.parseInt(month);
     int dayParsed = Integer.parseInt(day);
     if(monthParsed < 1 && monthParsed > 12 && dayParsed < 1 && dayParsed > 31)
     {
       return monthParsed;
     }
     else
     {
       return 0;
     }
   }
   catch(NumberFormatException e)
   {
      return 0;
   }
 }
  
class AirportAvailable { // added by pratyaksh
  String text;
  int x, y, w, h;

  AirportAvailable(String text, int x, int y, int w, int h) {
    this.text = text;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() { // added by pratyaksh
    fill(#50a2eb); // Yellow fill
    stroke(#eae8eb); // Black border
    rect(x, y, w, h, 5); // Slightly rounded corners for aesthetics
    fill(#eae8eb); // Black text
    textAlign(CENTER, CENTER);
    textSize(15);
    text(text, x + w/2, y + h/2);
  }

  boolean isClicked(int mouseX, int mouseY) { // added by pratyaksh
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
