package lk.ijse.eplatform.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String description;
    private double price;
    private int quantity;
    private int categoryId;
    private String image_path;

    public Product(int id, String name, double price, String imageUrl, int categoryId) {
    }



//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private int productId;
//
//    @Column(nullable = false)
//    private String productName;
//
//    @Column(length = 1000)
//    private String productDescription;
//
//    @Column(nullable = false)
//    private double  productPrice;
//
//    @Column(nullable = false)
//    private int productQuantity;
//
//    @ManyToOne
//    @JoinColumn(name = "category_id", nullable = false)
//    private Category category;
//
//    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private List<OrderDetail> orderDetails = new ArrayList<>();
}

