/*
 Part 1: Basic requirements (5 points):

	•	The program shall allow the user to select from the following options:
	•	Create a new meeting
	•	Show meetings for the week
	•	Clear meetings for the week
	•	Each meeting has a subject, day of the week, start time and end time
	•	Subject is a short text description of the meeting
	•	Day of the week is a number from 1 to 7 (day 1, day 2, …, day 7)
	•	Start time are numbers simulating military time. For example, 9:30am would be 930, 1:15pm would be 1315. The range for time is from 0 to 2359
	•	When the user wants to create a new meeting, the program asks for the subject, day of the week, start and end times for it and adds it to the weekly calendar
	•	Meetings are not allowed to overlap. For example, if a meeting is already scheduled to start at 1400 and end at 1530, a new meeting scheduled from 1300 to 1430 would not be allowed
	•	Meetings are not allowed to go into the next day. For example, if a user attempted to start a meeting at 2330 and end at 200, that meeting would not be allowed
	•	When the user wants to show all meetings for the week, the report displays all meetings each day as follows
	•	Show each day of the week from 1 to 7
	•	For each day, show all meetings scheduled and the total number of meetings for that day
	•	At the end of the report, show the total number of all meetings for the week
	•	When the user wants to clear meetings for the week, all meetings scheduled are deleted
	•	The user can do any of these options at any time until they want to exit the program

Technical requirements:

	•	You must have at least one array
	•	Assume the user will enter data correctly with valid start and end times

Part 2: Additional requirements: (5 more points)

	•	Each meeting now also has a priority of either critical or non-critical. This makes all meetings having a subject, priority, day of the week, start and end time

Additional technical requirement:

	•	You must create a “Meeting” class with the appropriate properties (you should have at least 5) that are private and at least have a constructor and the corresponding set/get methods 

Part 3: Enhanced requirements (5 more points)

	•	Each meeting now also has a numeric ID automatically assigned with each new meeting scheduled. Each meeting ID instance must be I different number
	•	Allow the user to delete individual meetings from the calendar. When the user wants to do this, the program asks the user for the ID of the meeting. If the meeting is found from the ID, the program shows the meeting to the user and first asks, “Are you sure you want to remove this?” The meeting is removed if the user confirms deleting it
	•	Allow the user to update individual meetings from the calendar. When the user wants to do this, the program asks the user for the ID of the meeting. If the meeting is found from the ID, the program shows the meeting to the user and allows the user to enter new information about the meeting. If the start or end times change, the rules for meetings not overlapping still apply
	•	Meetings can now span multiple days. For example, a meeting can go from day 2 of the week starting at 1600 and ending on day 3 at 1130. The rules for meetings not overlapping still apply

Additional technical requirement:

	•	Assume the user will still enter data formatted correctly but may enter times out of range such as “2500” or “1175”. Use try…catch exception handling to capture these time out of range exceptions

Part 4: Advanced requirements (3 points each)

	•	Allow for multiple weeks denoted by week number from 1 to 50. Each week has its own set of 7 days and meetings within them. Meetings can span from week to week (for example, a meeting can start on week 2, day 6 at 1800 and end on week 3, day 1 at 1200)
	•	Allow the user to save and load meeting data
	•	Create a simple graphical user interface to communicate with the user
	•	Create additional classes such as a “Time” class and a “MeetingWeek” class

 */
package finalproject;

/**
 *
 * @author colbyhawker
 */

import java.util.Scanner;
import java.util.InputMismatchException;
import javax.swing.JFrame;

public class FinalProject {

     public static void printMenu()
    {
        System.out.println("menu");
        System.out.println("Enter option:\n"
                + "1 = Enter Meetings\n" 
                + "2 = Show All Meetings\n"
                + "3 = Clear All Meetings\n"
                + "4 = Clear One Meeting\n"
                + "5 = Update One meeting\n"
                + "6 = Done - Exit\n"
                + "7 = Save and Read\n");
               

    }
     
    public static void main(String[] args) 
    {
        //initializaing option menu
        int option;
        Scanner input = new Scanner(System.in);       
    
        
        //initializing an array to organize each day
        int numberOfmeetings = 0;
        Meeting[] dailySchedule = new Meeting[100];
         
        do
        {
            printMenu();
            option = input.nextInt();
            input.nextLine();
 
            switch(option)
            {
                case 1:
                    // Add Appointment
                try
                {
                    /*
                    TextFieldFrame tf = new TextFieldFrame();
                    tf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                    tf.setSize(200, 300);
                    tf.setLocation(200, 200);
                    tf.setVisible(true);
                    */
             
                    System.out.print("Enter meeting day: ");
                    Scanner inputDay = new Scanner(System.in);
                    int day = inputDay.nextInt();
                    
                    
                    System.out.print("Enter subject: ");
                    Scanner inputSubject = new Scanner(System.in);
                    String subject = inputSubject.next();
                    

                    System.out.print("Enter start time: ");
                    Scanner inputStartTime = new Scanner(System.in);
                    int startTime = inputStartTime.nextInt();
                      
                    
                    for(int c=0; c < numberOfmeetings; c++)
                      {
                          while(day==dailySchedule[c].getDay() && startTime < dailySchedule[c].getEndTime() && startTime >= dailySchedule[c].getStartTime())
    
                          {
                 
                               System.out.println("Meetings can't overlap."
                               +" Please enter new start time: ");
                               startTime = inputStartTime.nextInt();
                            
                          }
                      }
                    
                    while(startTime > 2399 || startTime < 0)
                        {
                 
                               System.out.println("Invalid Start Time. Enter Again ");
                               startTime = inputStartTime.nextInt();

                          }
                    
                   
                    System.out.print("Enter end Day: ");
                    Scanner inputDiff = new Scanner(System.in);
                    int endDay = inputDiff.nextInt();

                   
                    
                    System.out.print("Enter end Time: ");
                    Scanner inputEndTime = new Scanner(System.in);
                    int endTime = inputEndTime.nextInt();
                    //Cannot go to next day
                    /*
                    while (endTime < startTime)
                    {
                        System.out.println("Meetings can't go to next day"
                               +" and can't overlap: ");
                        endTime = inputEndTime.nextInt();
                    } 
                    */

                    
                    for(int c=0; c < numberOfmeetings; c++)
                      {
                          while(day==dailySchedule[c].getDay() && endTime <= dailySchedule[c].getEndTime() && endTime > dailySchedule[c].getStartTime())
                     
                          {
                              
                            System.out.println("Meetings can't overlap."
                                +" Please enter new end time: ");
                                endTime = inputEndTime.nextInt();
  
                          }
                      }

                    
                    while(endTime >2399 || endTime < 0)
                    {
                        System.out.println("Invalid End Time. Enter Again");
                            endTime = inputEndTime.nextInt();
                    }
                    //3-4 6-8
                    //Cannot be between the start and end time for any entry 
                    //belonging to that day. Should I include an array in the
                    //Meetings.java file?

                    
                    System.out.print("Priority? (enter 'true' for critical or 'false' for non-critical):");
                    Scanner inputPriority = new Scanner(System.in);
                    boolean priority = inputPriority.nextBoolean();
                    
                    dailySchedule[numberOfmeetings++] = 
                      new Meeting(subject, day, startTime, endDay, endTime, priority, numberOfmeetings-1);
                
                }
                catch (InputMismatchException e)
                {
                    System.out.println("You entered incorrectly");
                }
                catch (Exception e)
                {
                    System.out.println(e);
                }
                
                  
                    break;
                case 2:
                    // Display meetings
                    
                    //go through each day of the week

                   for(int d = 1; d < 8; d++)
                        
                   {
                        //if(dailySchedule[0][1] == 1)
                        System.out.println("Day: " + d); 
                        int totalMeetings = 0;

                        for(int c = 0; c < numberOfmeetings; c++)    
                        {
                            if(dailySchedule[c].getDay() == d)  
                            {
                            System.out.println("    Meeting ID " + dailySchedule[c].getId() + " on " + dailySchedule[c].getDayName());
                            System.out.println("    Subject: " + dailySchedule[c].getSubject());
                            System.out.println("    Start Time: " + dailySchedule[c].getStartTime());
                            System.out.println("    End Time: " + dailySchedule[c].getEndTime());
                            System.out.println("    *End Day: " + dailySchedule[c].getEndDay());
                            System.out.println("    Critical: " + dailySchedule[c].getPriority() +"\n");
                            //System.out.println("Id " + dailySchedule[c].getId());
                
                            totalMeetings++;
                            }
                        } 
                        
                        System.out.println("    Total meetings today: "+ totalMeetings +"\n");
                   }
                    
                   System.out.println("Number of Meetings this week: " + numberOfmeetings +"\n");
                    
                    break;
                    
                case 3:
                    
                    for(int c = 0; c < numberOfmeetings; c++)
                        dailySchedule[c] = null;
                    numberOfmeetings = 0;
                    
                    break;
                    
                case 4:
 
                    System.out.println("Please enter a meeting ID to remove: ");
                    int idDelete = input.nextInt();
                    try
                    {  
                        for(int c = 0; c < numberOfmeetings; c++)
                        {
                            if(dailySchedule[c].getId() == idDelete)
                            {
                            System.out.println("    Meeting ID " + dailySchedule[c].getId() + " on " + dailySchedule[c].getDayName());
                            System.out.println("    Subject: " + dailySchedule[c].getSubject());
                            System.out.println("    Start Time: " + dailySchedule[c].getStartTime());
                            System.out.println("    End Time: " + dailySchedule[c].getEndTime());
                            System.out.println("    Critical: " + dailySchedule[c].getPriority() +"\n");     
                            }
                        }
                        System.out.println("Are you sure you want to remove this? (y=1/n=2)");
                        int remove = input.nextInt();
                    
                        if(remove == 1)
                        {
                        for(int c = 1; c < numberOfmeetings; c++)
                            dailySchedule[idDelete] = null;
                        }
                        numberOfmeetings--;
                    }
                    catch (Exception e)
                    {
                    System.out.println("Error");
                    }
                    
                   
                    
                    break; 
                    
                case 5:
                    System.out.println("Please enter a meeting ID to update: ");
                    int idUpdate = input.nextInt();
                    try
                    {  
                        for(int c = 0; c < numberOfmeetings; c++)  
                            if(dailySchedule[c].getId() == idUpdate) 
                            {
                            System.out.println("    Meeting ID " + dailySchedule[c].getId() + " on " + dailySchedule[c].getDayName());
                            System.out.println("    Subject: " + dailySchedule[c].getSubject());
                            System.out.println("    Start Time: " + dailySchedule[c].getStartTime());
                            System.out.println("    End Time: " + dailySchedule[c].getEndTime());
                            System.out.println("    *End Day: " + dailySchedule[c].getEndDay());
                            System.out.println("    Critical: " + dailySchedule[c].getPriority() +"\n");     
                            }
                    }
                   
                    catch(Exception e)
                    {
                        System.out.println("Error");
                    }
                    
                    System.out.print("Enter meeting day: ");
                    Scanner inputDay = new Scanner(System.in);
                    int day = inputDay.nextInt();
                    
                    
                    System.out.print("Enter subject: ");
                    Scanner inputSubject = new Scanner(System.in);
                    String subject = inputSubject.next();
                    
                    
                    System.out.print("Enter start time: ");
                    Scanner inputStartTime = new Scanner(System.in);
                    int startTime = inputStartTime.nextInt();
                    
                    while(startTime > 2399 || startTime < 0)
                        {
                               System.out.println("Invalid Start Time. Enter Again ");
                               startTime = inputStartTime.nextInt();
                          }
                
                    for(int c=1; c < numberOfmeetings; c++)
                      {
                          while(day==dailySchedule[c].getDay() && startTime < dailySchedule[c].getEndTime() && startTime >= dailySchedule[c].getStartTime())
                                  
                          {
                               System.out.println("Meetings can't overlap."
                               +" Please enter new start time: ");
                               startTime = inputStartTime.nextInt();
                          }
                      }
                    
                    int endDay = day;
                    System.out.println("Different meeting end day? (yes = 1/no = 2): ");
                    Scanner inputDiff = new Scanner(System.in);
                    int diff = inputDiff.nextInt();

                    if(diff == 1)
                    {
                        System.out.println("Enter End Day: ");
                        Scanner inputEndDay = new Scanner(System.in);
                        endDay = inputEndDay.nextInt();
                    }
                    else
                    {
                        endDay = day;  
                    }
                    
                    
                    System.out.println("Enter end time: ");
                    Scanner inputEndTime = new Scanner(System.in);
                    int endTime = inputEndTime.nextInt();
                    
                    while(endTime >2399 || endTime < 0)
                    {
                        System.out.println("Invalid End Time. Enter Again");
                            endTime = inputEndTime.nextInt();
                    }
                    
                    for(int c=0; c < numberOfmeetings; c++)
                      {
                          while(day==dailySchedule[c].getDay() && endTime <= dailySchedule[c].getEndTime() && endTime > dailySchedule[c].getStartTime())
                          {
                              
                               System.out.println("Meetings can't overlap."
                               +" Please enter new end time: ");
                               endTime = inputStartTime.nextInt();
                              
                          }
                      }

                    
                    System.out.print("Enter priority: ");
                    Scanner inputPriority = new Scanner(System.in);
                    boolean priority = inputPriority.nextBoolean();
                   
                    dailySchedule[idUpdate].setDay(day);
                    dailySchedule[idUpdate].setSubject(subject);
                    dailySchedule[idUpdate].setStartTime(startTime);
                    dailySchedule[idUpdate].setEndDay(endDay);
                    dailySchedule[idUpdate].setEndTime(endTime);
                    dailySchedule[idUpdate].setPriority(priority);

                    break;
                    
                case 6:
                    System.out.println("Thank you!");
                    
                    break;
                    
                case 7:
                    //Save (write) files
                    System.out.println("Saving files...");

                    MeetingFileWriter app = new MeetingFileWriter();

                    app.openFile();
                    app.saveRecords(dailySchedule, numberOfmeetings);
                    app.closeFile();
                    
                    System.out.println("Files saved");
                 
                    break;
                case 8:
                    //Read files
                    MeetingFileReader app2 = new MeetingFileReader();

                    for(int c = 0; c < dailySchedule.length; c++)
                        dailySchedule[c] = null;

                    app2.openFile();
                    numberOfmeetings = app2.readRecords(dailySchedule);
                    app2.closeFile();

                    for(int c = 0; c < numberOfmeetings; c++)     
                        System.out.println(dailySchedule[c]);
                        
                    break;    
                default:
                    System.out.println("Incorrect option");
                    break;
            }
        } while (option != 4);
        
        
    }
    
}
