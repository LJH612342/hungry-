package cn.hungry.service;

import java.util.List;


import cn.hungry.pojo.Order;

public interface OrderService {
	List<Order> listByUser(int uid);
	
	List<Order> list();
	
	int add(Order order);
	
	boolean delete(Order order);

	Order get(int id);

    boolean update(Order order);
    
    Float getTotalPrice(int oid);
    
    boolean setPay(int oid);
    
    boolean delivery(Order order);
    
    boolean setConfirm_date(Order order);
}
