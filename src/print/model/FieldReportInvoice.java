package print.model;

import java.util.List;

public class FieldReportInvoice {

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getInvoice() {
        return invoice;
    }

    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getTotalQty() {
        return totalQty;
    }

    public void setTotalQty(int totalQty) {
        this.totalQty = totalQty;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<FieldReportInvoiceDetail> getDetail() {
        return detail;
    }

    public void setDetail(List<FieldReportInvoiceDetail> detail) {
        this.detail = detail;
    }

    public FieldReportInvoice(int no, String invoice, String date, String time, int totalQty, double totalAmount, List<FieldReportInvoiceDetail> detail) {
        this.no = no;
        this.invoice = invoice;
        this.date = date;
        this.time = time;
        this.totalQty = totalQty;
        this.totalAmount = totalAmount;
        this.detail = detail;
    }

    public FieldReportInvoice() {
    }

    private int no;
    private String invoice;
    private String date;
    private String time;
    private int totalQty;
    private double totalAmount;
    private List<FieldReportInvoiceDetail> detail;
}
