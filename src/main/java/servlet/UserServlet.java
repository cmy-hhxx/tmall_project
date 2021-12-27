package servlet;

import bean.User;
import service.UserService;
import util.Pagination;
import util.PaginationUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/user.servlet")
public class UserServlet extends BaseServlet{
    private UserService service = new UserService();
    public String list(HttpServletRequest request, HttpServletResponse response){
        Pagination pagination= PaginationUtil.createPagination(request,service.getTotal());
        List<User> users = service.list(pagination.getStart(),pagination.getCount());
        request.setAttribute("users",users);
        request.setAttribute("pagination",pagination);
        return "jsp/admin/listUser.jsp";
    }
}
