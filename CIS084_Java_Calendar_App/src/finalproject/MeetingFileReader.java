/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalproject;

import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

/**
 *
 * @author colby
 */
public class MeetingFileReader 
{
    private Scanner input;
    
    public MeetingFileReader()
    {
        input = null;
    }
    
    public void openFile()
    {
        try
        {
            input = new Scanner(new File("accounts.txt"));
        }
        catch (FileNotFoundException e)
        {
            System.out.println("File not found");
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }
    
    public int readRecords(Meeting[] accts)
    {
        int numberOfmeetings = 0;
        
        try
        {
            while(input.hasNext())
            {
                accts[numberOfmeetings] = new Meeting();
                accts[numberOfmeetings].setId(input.nextInt());
                accts[numberOfmeetings].setSubject(input.next());
                accts[numberOfmeetings].setDay(input.nextInt());
                accts[numberOfmeetings].setStartTime(input.nextInt());
                accts[numberOfmeetings].setEndTime(input.nextInt());
                //accts[numberOfmeetings].setPriority(input.nextBoolean());

                numberOfmeetings++;
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return numberOfmeetings;
    }
    
    public void closeFile()
    {
        if (input != null)
            input.close();
    }
}