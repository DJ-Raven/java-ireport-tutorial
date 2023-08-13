package print.model;

import java.util.List;

public class ParameterReportInvoice {

    public double getTotalQty() {
        return totalQty;
    }

    public void setTotalQty(double totalQty) {
        this.totalQty = totalQty;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<FieldReportInvoice> getFields() {
        return fields;
    }

    public void setFields(List<FieldReportInvoice> fields) {
        this.fields = fields;
    }

    public ParameterReportInvoice(double totalQty, double totalAmount, List<FieldReportInvoice> fields) {
        this.totalQty = totalQty;
        this.totalAmount = totalAmount;
        this.fields = fields;
    }

    public ParameterReportInvoice() {
    }
    private double totalQty;
    private double totalAmount;
    private List<FieldReportInvoice> fields;
}
