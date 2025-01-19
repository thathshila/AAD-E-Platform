package lk.ijse.eplatform.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Cart {
    private int cartId;
    private int userId;
    private int productId;
    private int quantity;
}
