package finalproject.com.model;

public class ProductInsert {
    
    private String pname;
    private double price;
    private String description;
    private String image;
    private int qty;
    private String category;

    public ProductInsert() {}

    public ProductInsert(String pname, double price, String description, String image, int qty, String category) {
        this.pname = pname;
        this.price = price;
        this.description = description;
        this.image = image;
        this.qty = qty;
        this.category = category;
    }

    // Getters and setters for all fields
    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "ProductInsert [pname=" + pname + ", price=" + price + ", description=" + description + 
               ", image=" + image + ", qty=" + qty + ", category=" + category + "]";
    }
}
