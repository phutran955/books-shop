/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trang
 */
public class ProductDTO {

    private String id;
    private String name;
    private String image;
    private String description;
    private double price;
    private String catID;
    private boolean status;

    // Default constructor
    public ProductDTO() {
    }

    public ProductDTO(String id, String name, String image, String description, double price, String catID, boolean status) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.price = price;
        this.catID = catID;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCatID() {
        return catID;
    }

    public void setCatID(String catID) {
        this.catID = catID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    // Utility methods
    public String getStatusText() {
        return status ? "Active" : "Inactive";
    }

    public String getFormattedPrice() {
        return String.format("$%.2f", price);
    }

    // toString method for debugging
    @Override
    public String toString() {
        return "ProductDTO{"
                + "id='" + id + '\''
                + ", name='" + name + '\''
                + ", image='" + image + '\''
                + ", description='" + description + '\''
                + ", price=" + price
                + ", catID='" + catID + '\''
                + ", status=" + status
                + '}';
    }

    // equals method for comparison
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }

        ProductDTO that = (ProductDTO) obj;
        return id != null ? id.equals(that.id) : that.id == null;
    }

    // hashCode method
    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
