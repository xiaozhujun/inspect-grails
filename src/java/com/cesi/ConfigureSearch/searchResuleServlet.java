package com.cesi.ConfigureSearch;

import com.springsource.roo.inspect.dao.DBImpl;
import model.PageInspectTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-11-1
 * Time: 下午4:24
 * To change this template use File | Settings | File Templates.
 */
public class searchResuleServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String name=request.getParameter("name");
        String type=request.getParameter("type");
        String ck=request.getParameter("ck");
        PrintWriter out = response.getWriter();
        DBImpl d = new DBImpl();
        PageInspectTable p = null;
        List<PageInspectTable> list = new ArrayList<PageInspectTable>();
        if (name == "" && type == "" && ck == "") {
            out.println("对不起,请输入查询条件！");
        } else {
            String tableTemplate = "<form method='post'><table border=1 class='tb1'>" +
                    "<thead><tr><th width='100px'>用户编号</th><th width='120px'>用户名</th><th width='100px'>类型编号</th><th width='120px'>类型名</th><th width='100px'>操作</th></thead><tbody>";
            String tfootTemplate = "</table></form>";
            String empty = "对不起，查询记录不存在！";
            if (name != "" && type != "" && ck != "") {
                int t = Integer.parseInt(type);
                list = d.geturoleByNameTypeHas(name, t, ck);
                if (list.size() == 0) {
                    out.println(empty);
                } else {
                    out.println(tableTemplate);
                    Iterator it1 = list.iterator();
                    while (it1.hasNext()) {
                        p = (PageInspectTable) it1.next();
                        out.println(d.returnTableContentString(p));
                    }
                    out.println(tfootTemplate);
                }
            } else if (name != "" && type != "") {
                int t = Integer.parseInt(type);
                list = d.geturoleByNameRole(name, t);
                if (list.size() == 0) {
                    out.println(empty);
                } else {
                    out.println(tableTemplate);
                    Iterator it1 = list.iterator();
                    while (it1.hasNext()) {
                        p = (PageInspectTable) it1.next();
                        out.println(d.returnTableContentString(p));
                    }
                    out.println(tfootTemplate);
                }
            } else if (name != "" && ck != "") {
                list = d.geturoleByNameHas(name, ck);
                if (list.size() == 0) {
                    out.println(empty);
                } else {
                    out.println(tableTemplate);
                    Iterator it1 = list.iterator();
                    while (it1.hasNext()) {
                        p = (PageInspectTable) it1.next();
                        out.println(d.returnTableContentString(p));
                    }
                    out.println(tfootTemplate);
                }
            } else if (type != "" && ck != "") {
                int t = Integer.parseInt(type);
                list = d.geturoleByTypeHas(t, ck);
                if (list.size() == 0) {
                    out.println(empty);
                } else {
                    out.println(tableTemplate);
                    Iterator it1 = list.iterator();
                    while (it1.hasNext()) {
                        p = (PageInspectTable) it1.next();
                        out.println(d.returnTableContentString(p));
                    }
                    out.println(tfootTemplate);
                }
            } else if (name != "") {
                list = d.geturole(name);
                if (list.size() == 0) {
                    out.println(empty);
                } else {
                    out.println(tableTemplate);
                    Iterator it = list.iterator();
                    while (it.hasNext()) {
                        p = (PageInspectTable) it.next();
                        out.println(d.returnTableContentString(p));
                    }
                    out.println(tfootTemplate);
                }
            } else if (type != "") {
                int t = Integer.parseInt(type);
                list = d.geturoleBytype(t);
                if (list.size() == 0) {
                    out.println(empty);
                } else {
                    out.println(tableTemplate);
                    Iterator it1 = list.iterator();
                    while (it1.hasNext()) {
                        p = (PageInspectTable) it1.next();
                        out.println(d.returnTableContentString(p));
                    }
                    out.println(tfootTemplate);
                }
            } else if (ck != "") {

                if (ck.equals("0")) {
                    list = d.geturoleByHas("否");
                    if (list.size() == 0) {
                        out.println(empty);
                    } else {
                        out.println(tableTemplate);
                        Iterator it1 = list.iterator();
                        while (it1.hasNext()) {
                            p = (PageInspectTable) it1.next();
                            out.println(d.returnTableContentString(p));
                        }
                        out.println(tfootTemplate);
                    }
                } else if (ck.equals("1")) {
                    list = d.geturoleByHas("是");
                    if (list.size() == 0) {
                        out.println(empty);
                    } else {
                        out.println(tableTemplate);
                        Iterator it1 = list.iterator();
                        while (it1.hasNext()) {
                            p = (PageInspectTable) it1.next();
                            out.println(d.returnTableContentString(p));
                        }
                        out.println(tfootTemplate);
                    }
                }
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                doPost(request,response);
    }
}
