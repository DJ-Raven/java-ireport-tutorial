package demo.sample2;

import com.formdev.flatlaf.FlatIntelliJLaf;
import connection.DatabaseConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import print.ReportManager;
import print.model.FieldReportInvoice;
import print.model.FieldReportInvoiceDetail;
import print.model.ParameterReportInvoice;

/**
 *
 * @author RAVEN
 */
public class Test extends javax.swing.JFrame {

    /**
     * Creates new form Test
     */
    public Test() {
        initComponents();
        try {
            DatabaseConnection.getInstance().connectToDatabase();
            ReportManager.getInstance().compileReport();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jButton1.setText("Print Report");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(218, 218, 218)
                .addComponent(jButton1)
                .addContainerGap(221, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(183, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(177, 177, 177))
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        try {
            ReportManager.getInstance().printReportInvoice(getDataPrint());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private ParameterReportInvoice getDataPrint() throws SQLException {
        String sql = "select InvoiceID, InvoiceNumber, Date, Time, TotalQty, TotalAmount from invoice order by InvoiceNumber";
        String sqlDetail = "select ProductName, Qty, Price, Total from invoice_detail join product using (ProductID) where InvoiceID=?";

        PreparedStatement p = DatabaseConnection.getInstance().getConnection().prepareStatement(sql);
        PreparedStatement pd = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlDetail);
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat tf = new SimpleDateFormat("hh:mm aa");
        List<FieldReportInvoice> fiels = new ArrayList<>();
        ResultSet r = p.executeQuery();
        int toalReportQty = 0;
        double totalReportAmount = 0;
        int no = 0;
        while (r.next()) {
            int invoiceID = r.getInt("InvoiceID");
            String invoice = r.getString("InvoiceNumber");
            String date = df.format(r.getDate("Date"));
            String time = tf.format(r.getTime("Time"));
            int totalQty = r.getInt("TotalQty");
            double totalAmount = r.getDouble("TotalAmount");
            toalReportQty += totalQty;
            totalReportAmount += totalAmount;

            pd.setInt(1, invoiceID);
            ResultSet rd = pd.executeQuery();
            List<FieldReportInvoiceDetail> detail = null;
            if (rd.next()) {
                detail = new ArrayList<>();
                do {
                    String product = rd.getString("ProductName");
                    int qty = rd.getInt("Qty");
                    double price = rd.getDouble("Price");
                    double total = rd.getDouble("Total");
                    detail.add(new FieldReportInvoiceDetail(product, qty, price, total));
                } while (rd.next());
            }
            rd.close();
            fiels.add(new FieldReportInvoice(++no, invoice, date, time, totalQty, totalAmount, detail));
        }
        r.close();
        pd.close();
        p.close();
        return new ParameterReportInvoice(toalReportQty, totalReportAmount, fiels);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        FlatIntelliJLaf.setup();
        java.awt.EventQueue.invokeLater(() -> {
            new Test().setVisible(true);
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    // End of variables declaration//GEN-END:variables
}
