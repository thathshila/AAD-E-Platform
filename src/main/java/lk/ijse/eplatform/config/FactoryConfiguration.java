package lk.ijse.eplatform.config;


import lk.ijse.eplatform.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.IOException;
import java.util.Properties;

public class FactoryConfiguration {
    private static FactoryConfiguration factoryConfiguration;
    private static SessionFactory sessionFactory;
    private FactoryConfiguration() throws IOException {
        Configuration configuration = new Configuration();
        Properties properties = new Properties();
        properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("hibernate.properties"));
        configuration.addAnnotatedClass(Cart.class);
        configuration.addAnnotatedClass(CartItem.class);
        configuration.addAnnotatedClass(Product.class);
        configuration.addAnnotatedClass(User.class);
        configuration.addAnnotatedClass(Order.class);
        configuration.addAnnotatedClass(OrderDetail.class);
        configuration.setProperties(properties);
        sessionFactory = configuration.buildSessionFactory();
    }

    public static void setSessionFactory(SessionFactory sf) {
        sessionFactory = sf;
    }
    public static FactoryConfiguration getInstance() throws IOException {
        return (factoryConfiguration==null) ? factoryConfiguration=new FactoryConfiguration():factoryConfiguration;
    }

    public Session getSession(){
        return sessionFactory.openSession();
    }
}
