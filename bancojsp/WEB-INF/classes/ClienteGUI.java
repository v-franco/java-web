import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class ClienteGUI extends JFrame implements ActionListener{

    private BancoADjdbc bank = new BancoADjdbc();
    //private BancoAD bank = new BancoAD();

    private JTextField tfNocta, tfName, tfType, tfBalance;
    private JButton bCapture, bConsult, bConsultNocta, bConsultType, bExit;
    private JTextArea taData;
    private JPanel panel1, panel2;

    public ClienteGUI(){
        
        setTitle("Banco WEB-OOP");

        tfNocta         = new JTextField();
        tfName          = new JTextField();
        tfType          = new JTextField();
        tfBalance       = new JTextField(); 
        bCapture        = new JButton("Capture data");
        bConsult        = new JButton("Consult data");
        bConsultNocta   = new JButton("Consult account no.");
        bConsultType    = new JButton("Consult account type");
        bExit           = new JButton("Exit");
        taData          = new JTextArea(10,20);
        panel1          = new JPanel();
        panel2          = new JPanel();

        bExit.addActionListener(this);
        bCapture.addActionListener(this);
        bConsult.addActionListener(this);
        bConsultNocta.addActionListener(this);
        bConsultType.addActionListener(this);

        panel1.setLayout(new GridLayout(7,2));
        panel2.setLayout(new FlowLayout());

        panel1.add(new JLabel("Account number: "));
        panel1.add(tfNocta);
        panel1.add(new JLabel("Name: "));
        panel1.add(tfName);
        panel1.add(new JLabel("Account type: "));
        panel1.add(tfType);
        panel1.add(new JLabel("Account balance: "));
        panel1.add(tfBalance);
        panel1.add(bCapture);
        panel1.add(bConsult);
        panel1.add(bConsultNocta);
        panel1.add(bConsultType);
        panel1.add(bExit);

        panel2.add(panel1);
        panel2.add(new JScrollPane(taData));

        add(panel2);
        setSize(400,350);
        setVisible(true);

        //setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    }

    private String obtainData(){

        String ncta, name, type, balance, data="";

        ncta = tfNocta.getText();
        name = tfName.getText();
        type = tfType.getText();
        balance = tfBalance.getText();

        if(ncta.equals("") || name.isEmpty() || type.isEmpty() || balance.equals("")){
            data="Empty";
        }
        else{
            try{
                int quantity = Integer.parseInt(balance); 
                data = ncta+"_"+name+"_"+type+"_"+balance;
            }
            catch(NumberFormatException nfe){
                data="Not numeric";
                System.out.println("Error "+nfe);
            }
            
        }
        return data;
    }

     public void actionPerformed(ActionEvent event){
         String answer="", data;
         if(event.getSource() == bExit){
            System.exit(0);
        }
        if(event.getSource() == bCapture){
            data = obtainData();
            if(data.equals("Empty")){
                answer = "Some field is empty";
            }
            else{
                if(data.equals("Not numeric")){
                    answer = "Balance not numeric";
                }
                else{
                    answer = data;
                    answer = bank.captureData(data);
                }
                
            }
            taData.setText(answer);   
        }
        if(event.getSource() == bConsult){
            taData.setText(bank.consultData());
        }

        if(event.getSource() == bConsultNocta){
           String ncta = tfNocta.getText();
           taData.setText(bank.consultNcta(ncta));
        }

        if(event.getSource() == bConsultType){
            String tcta = tfType.getText();
            taData.setText(bank.consultType(tcta));
            
        }
     }

    public static void main(String args[]){
        ClienteGUI client = new ClienteGUI();

        
    }
}