package com.servlet;

import com.entity.cart;
import com.entity.item;
import com.sun.org.apache.bcel.internal.generic.INEG;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 34432 on 2017/5/19.
 */
@WebServlet(name = "CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int num = Integer.parseInt(request.getParameter("numbers")); //拿到选择商品的数目
        response.setContentType("text/html");
        double sum;
        HttpSession session = request.getSession();
        if (num < 1) {
            PrintWriter out = response.getWriter();
            out.println("You can't input 0");
        } else {
            if (session.getAttribute("list") == null) {
                List<item> lists = new ArrayList<item>();
                item it = new item();
                String name = request.getParameter("name");
                int id = Integer.parseInt(request.getParameter("id")); //选择了哪个ID
                String idName = Integer.toString(id);
                //判断之前是否选择过
                if (session.getAttribute(idName) == null ) {
                    session.setAttribute(idName,num); //以商品id为key，数目为value，记录这个id的商品选择了多少件
                    double price = Double.parseDouble(request.getParameter("price"));
                    String place = request.getParameter("place");
                    it.setName(name);
                    it.setId(id);
                    it.setPrice(price);
                    it.setPlace(place);
                    lists.add(it);
                    sum = num * price;
                    cart cart = new cart();
                    cart.setSum(sum);
                    cart.setLists(lists);
                    session.setAttribute("sum", sum);
                    session.setAttribute("list", lists);
                    session.setAttribute("cart", cart);
                    request.setAttribute("id",id);
                } else {
                    String num_continue = (String)session.getAttribute(idName); //如果之前选择过，则通过商品id，拿出这个id已经选择了多少件
                    int sum_num = num + Integer.parseInt(num_continue); //之前选择过，把新选择数目和已经选择的数目加起来
                    session.setAttribute(idName,sum_num);
                    double price = Double.parseDouble(request.getParameter("price"));
                    String place = request.getParameter("place");
                    it.setName(name);
                    it.setId(id);
                    it.setPrice(price);
                    it.setPlace(place);
                    lists.add(it);
                    sum = (num + Integer.parseInt(num_continue)) * price; //通过总数算出总价格
                    cart cart = new cart();
                    cart.setSum(sum);
                    cart.setLists(lists);
                    session.setAttribute("sum", sum);
                    session.setAttribute("list", lists);
                    session.setAttribute("cart", cart);
                    request.setAttribute("id",id);

                }

            } else {
                List<item> lists = (ArrayList<item>) session.getAttribute("list");
                item it = new item();
                String name = request.getParameter("name");
                int id = Integer.parseInt(request.getParameter("id"));
                String idName = Integer.toString(id);
                if (session.getAttribute(idName) == null) {
                    session.setAttribute(idName,num);
                    double price = Double.parseDouble(request.getParameter("price"));
                    String place = request.getParameter("place");
                    it.setName(name);
                    it.setId(id);
                    it.setPrice(price);
                    it.setPlace(place);
                    lists.add(it);
                    sum = num * price;
                    cart cart = new cart();
                    cart.setSum(sum);
                    cart.setLists(lists);
                    session.setAttribute("sum", sum);
                    session.setAttribute("list", lists);
                    session.setAttribute("cart", cart);
                    //               request.setAttribute("num",num);
                    request.setAttribute("id",id);
                } else {
                    String num_continue = Integer.toString((int)(session.getAttribute(idName))); //如果之前选择过，则通过商品id，拿出这个id已经选择了多少件
                    int sum_num = num + Integer.parseInt(num_continue); //之前选择过，把新选择数目和已经选择的数目加起来
                    session.setAttribute(idName,sum_num);
                    double price = Double.parseDouble(request.getParameter("price"));
                    String place = request.getParameter("place");
                    it.setName(name);
                    it.setId(id);
                    it.setPrice(price);
                    it.setPlace(place);
                    lists.add(it);
                    sum = (num + Integer.parseInt(num_continue)) * price; //通过总数算出总价格
                    cart cart = new cart();
                    cart.setSum(sum);
                    cart.setLists(lists);
                    session.setAttribute("sum", sum);
                    session.setAttribute("list", lists);
                    session.setAttribute("cart", cart);
                    request.setAttribute("id",id);
                }

            }

            request.getRequestDispatcher("cart.jsp").forward(request, response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
