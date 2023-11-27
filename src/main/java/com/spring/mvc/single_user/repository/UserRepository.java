package com.spring.mvc.single_user.repository;

import com.spring.mvc.single_user.entities.User;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


/*
只需定義 interface的規格，由SpringData實作內容
<User,Long> -> User為Entity的類別名稱，Long為@Id的資料型別
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    //根據 name 來取得User
    User getByName(String name);

    //WHERE name LIKE ?% AND id < ?
    //WHERE name LIKE 'S%' AND id < 100
    List<User> getByNameStartingWithAndIdLessThan(String name, Long id);

    //WHERE name LIKE ?% AND id >= ?
    List<User> getByNameStartingWithAndIdGreaterThanEqual(String name, Long id);

    //WHERE id in(?,?,?) OR birth <=?
    //WHERE id in(2,4,8,16...) OR birth <= '2000/12/31' 
    List<User> getByIdInOrBirthLessThanEqual(List<Long> ids, Date birth);

    //查詢 User + age < ? (但 age 非為 User.java 中的屬性)，使用JPQL
    @Query("SELECT u FROM User u WHERE (YEAR(current_date)- YEAR(u.birth)) < :age")
    List<User> getByAgeLessThan(Integer age);

    //查詢資料筆數(使用count(id))，使用SQL
    @Query(value = "SELECT count(id) FROM T_USER", nativeQuery = true)
    Long getTotalCount();

}
