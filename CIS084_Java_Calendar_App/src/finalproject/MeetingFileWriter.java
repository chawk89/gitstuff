/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalproject;

import java.util.Formatter;
import java.io.FileNotFoundException;

/**
 *
 * @author colby
 */
public class MeetingFileWriter 
{
    private Formatter output;
    
    public MeetingFileWriter()
    {
        output = null;
    }
    
    public void openFile()
    {
        try
        {
            output = new Formatter("accounts.txt");
        }
        catch (FileNotFoundException e)
        {
            System.out.println("Error trying to create or open file");
        }
        catch (Exception e)
        {
            System.out.println("That's no good...");
        }
    }
    
    public void saveRecords(Meeting[] accts, int n)
    {
        try
        {
            for (int c = 0; c < n; c++)
                output.format("%d\n %s\n %d\n %d\n %d\n", accts[c].getId(), accts[c].getSubject(), accts[c].getDay(), accts[c].getStartTime(), accts[c].getEndTime());
        }
        
        catch (Exception e)
        {
            System.out.println("Something happened with your file");
            output.close();
        }
    }
    
    public void closeFile()
    {
        if (output != null)
            output.close();
    }
}
