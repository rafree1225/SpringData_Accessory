package psi;

import com.spring.mvc.psi.entities.Product;
import com.spring.mvc.psi.entities.Purchase;
import com.spring.mvc.psi.entities.Sales;
import com.spring.mvc.psi.repository.ProductRepository;
import com.spring.mvc.psi.repository.PurchaseRepository;
import com.spring.mvc.psi.repository.SalesRepository;
import java.util.Arrays;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test1 {

    @Test
    public void t1() {

        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("springMVC-servlet.xml");

        ProductRepository pr = ctx.getBean(ProductRepository.class);
        PurchaseRepository ur = ctx.getBean(PurchaseRepository.class);
        SalesRepository sr = ctx.getBean(SalesRepository.class);

        //買進商品
        Product p1 = pr.findOne(1);
        Product p2 = pr.findOne(2);
        Product p3 = pr.findOne(3);
        Product p4 = pr.findOne(4);
        Product p5 = pr.findOne(5);
        Product p6 = pr.findOne(6);
        Product p7 = pr.findOne(7);
        Product p8 = pr.findOne(8);
        Product p9 = pr.findOne(9);
        Product p10 = pr.findOne(10);

//        Purchase u1 = new Purchase(550, 50, p1);
//        Purchase u2 = new Purchase(600, 55, p2);
//        Purchase u3 = new Purchase(250, 30, p3);
//        Purchase u4 = new Purchase(150, 20, p4);
//        Purchase u5 = new Purchase(350, 40, p5);
//        Purchase u6 = new Purchase(320, 50, p6);
//        Purchase u7 = new Purchase(400, 45, p7);
//        Purchase u8 = new Purchase(150, 30, p8);
//        Purchase u9 = new Purchase(200, 30, p9);
//        Purchase u10 = new Purchase(500, 40, p10);
//
//        ur.save(Arrays.asList(u1, u2, u3, u4, u5,u6, u7, u8, u9, u10));
        //銷出商品
        Sales s1 = new Sales(750, 20, p1);
        Sales s2 = new Sales(800, 30, p2);
        Sales s3 = new Sales(450, 20, p3);
        Sales s4 = new Sales(350, 20, p4);
        Sales s5 = new Sales(550, 10, p5);
        Sales s6 = new Sales(520, 15, p6);
        Sales s7 = new Sales(600, 30, p7);
        Sales s8 = new Sales(350, 20, p8);
        Sales s9 = new Sales(400, 20, p9);
        Sales s10 = new Sales(700, 25, p10);
        sr.save(Arrays.asList(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10));

        System.out.println("OK");

    }

}
