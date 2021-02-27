package BusinessLogicLayer;

public class Decor {
    
    String theme;   // Theme type
    String decorRequests;   // Additional decorations requests
    Boolean decorYN;  // Is decor needed
    double decorPrice;   // Price for decoration

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getDecorRequests() {
        return decorRequests;
    }

    public void setDecorRequests(String decorRequests) {
        this.decorRequests = decorRequests;
    }

    public Boolean getNeedDecor() {
        return decorYN;
    }

    public void setNeedDecor(Boolean needDecor) {
        this.decorYN = needDecor;
    }

    public double getDecorPrice() {
        return decorPrice;
    }

    public void setDecorPrice(double decorPrice) {
        this.decorPrice = decorPrice;
    }
}
