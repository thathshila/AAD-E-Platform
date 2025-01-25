package lk.ijse.eplatform.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartItemDTO {
    private int productId;
    private String productName;
    private double productPrice;
    private int quantity;
    private double subtotal;
    private String image_path;
}
