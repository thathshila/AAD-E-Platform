package lk.ijse.eplatform.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDTO {
    private int orderId;
    private int userId;
    private double totalPrice;
    private Date date;
}
