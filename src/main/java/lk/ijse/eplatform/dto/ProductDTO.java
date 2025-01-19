package lk.ijse.eplatform.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDTO {
    private int product_id;
    private String productName;
    private String productDescription;
    private double productPrice;
    private int productQuantity;
    private int category_id;

    public ProductDTO(Integer o, String name, String description, double price, int quantity, int categoryId) {
    }
}

