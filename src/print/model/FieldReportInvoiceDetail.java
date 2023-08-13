package print.model;

public class FieldReportInvoiceDetail {

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public FieldReportInvoiceDetail(String productName, int qty, double price, double total) {
        this.productName = productName;
        this.qty = qty;
        this.price = price;
        this.total = total;
    }

    public FieldReportInvoiceDetail() {
    }

    private String productName;
    private int qty;
    private double price;
    private double total;
}
