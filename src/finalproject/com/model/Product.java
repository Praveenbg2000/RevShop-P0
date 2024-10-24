package finalproject.com.model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String description; // Corrected spelling
    private String image;
    private String category;
    private int quantity; // Changed to lowercase 'q' for consistency

    // Default constructor
    public Product() {}

    // Constructor with parameters
    public Product(int id, String name, double price, String description, String image, String category, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description; // Corrected spelling
        this.image = image;
        this.category = category;
        this.quantity = quantity; // Corrected variable name
    }

    // Getter and setter methods

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description; // Corrected spelling
    }

    public void setDescription(String description) { // Corrected spelling
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getQuantity() {
        return quantity; // Corrected variable name
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity; // Corrected variable name
    }

    // toString method
    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description
                + ", image=" + image + ", category=" + category + ", quantity=" + quantity + "]";
    }
}
