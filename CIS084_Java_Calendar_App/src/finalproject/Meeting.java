/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalproject;

/**
 *
 * @author colbyhawker
 */
public class Meeting 
{
    //these are variable data definitions not variable declarations
    private String subject;
    private int day;
    private int startTime;
    private int endDay;
    private int endTime;
    private boolean priority;
    private int id;
   
    
    public Meeting()
    {
        subject = "";
        day = -1;
        startTime = -1;
        endDay = -1;
        endTime = -1; 
        priority = false;
        id = -1;
    }
    
    public Meeting(String s, int d, int i, int f, int e, boolean p, int t)
    {
        subject = s;
        day = d;
        startTime = i;
        endDay = f;
        endTime = e; 
        priority = p;
        id = t;
    }
    
    
    
    //these are functional definitions
    public void setSubject(String s)
    {
        subject = s;
    }
    
    public void setDay(Integer d)
    {
        day = d;
    }
    
    public void setStartTime(Integer i)
    {
        startTime = i;
    }
    
    public void setEndDay(Integer e)
    {
        endDay = e;
    }
    
    public void setEndTime(Integer i)
    {
        endTime = i;
    }
    
    public void setPriority(boolean i)
    {
        priority = i;
    }
    
    public void setId(int t)
    {
        id = t;
    }
    
    public String getSubject()
    {
        return subject;
    }
    
    public int getDay()
    {
        return day;
    }
    
    public String getDayName()
    {
        switch(day)
        {
            case 1:
                return "Monday";
            case 2:
                return "Tuesday";
            case 3:
                return "Wednesday";
            case 4:
                return "Thursday";
            case 5:
                return "Friday";
            case 6:
                return "Saturday";
            case 7:
                return "Sunday";
            default:
                return "Unrecognized Day";
        }
  
    }
    
    public Integer getStartTime()
    {
        return startTime;
    }
    
    public Integer getEndDay()
    {
        return startTime;
    }
    
    public Integer getEndTime()
    {
        return endTime;
    }
    
    public Boolean getPriority()
    {
        return priority;
    }
    
    public int getId()
    {
        return id;
    }
  
    
    public String toString()
    {
        return String.format("%s:\n\t%d @ f", subject, day, startTime);
    }
   
}
