/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalproject;

import java.awt.FlowLayout;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.JButton;

/**
 *
 * @author t212
 */
public class TextFieldFrame extends JFrame
{
    private JTextField tf1;
    private JTextField tf2;
    private JTextField tf3;
    private JButton calcButton;
    
    public TextFieldFrame()
    {
        super("GUI Example for Java");
        setLayout(new FlowLayout());
        
        tf1 = new JTextField(10);
        System.out.println("Insert");
        add(tf1);
        
        tf2 = new JTextField(10);
        add(tf2);
        
        tf3 = new JTextField(10);
        tf3.setEditable(false);
        add(tf3);
        
        calcButton = new JButton("Add to Calendar");
        add(calcButton);
        
        ButtonHandler bh = new ButtonHandler();
        calcButton.addActionListener(bh);
    }
    
    private class ButtonHandler implements ActionListener
    {
        public void actionPerformed(ActionEvent ae)
        {
            try
            {
                int n = Integer.parseInt(tf1.getText());
                int d = Integer.parseInt(tf2.getText());

                tf3.setText(Integer.toString(n / d));
            }
            catch (ArithmeticException e)
            {
                tf3.setText("No can do pal");
            }
            catch (Exception e)
            {
                tf3.setText("Error");
            }
        }
    }
}