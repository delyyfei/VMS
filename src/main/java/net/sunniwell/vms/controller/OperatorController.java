package net.sunniwell.vms.controller;

import net.sunniwell.vms.model.OperatorModel;
import net.sunniwell.vms.service.OperatorService;
import net.sunniwell.vms.util.TableResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author zhoudeming
 * @date 2016/11/10
 */
@Controller
public class OperatorController {

    private TableResult tableResult = new TableResult();

    @Resource
    private OperatorService operatorService;

    public TableResult getTableResult() {
        return tableResult;
    }

    @RequestMapping("/login")
    public String toLoginView(HttpSession session) {
        session.removeAttribute("admin");
        return "../login";
    }

    @RequestMapping("/index")
    public String login(String userName, String password, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        OperatorModel userModel = (OperatorModel) session.getAttribute("admin"); // 已登录
        if (null != userModel) {
            return "/index";
        } else {
            userModel = this.operatorService.login(userName, password);
            if (userModel != null) {
                session.setAttribute("admin", userModel);
                return "/index";
            } else {
                redirectAttributes.addFlashAttribute("message", "用户名或密码不正确！");
                return "redirect:/login";
            }
        }
    }

    @RequestMapping("/operator/add")
    @ResponseBody
    public Object add(OperatorModel operatorModel) throws Exception {
        return null;
    }

    @RequestMapping("/operator/findAll")
    @ResponseBody
    public Object findAll() throws Exception {
        this.tableResult.setData(this.operatorService.findAll());
        return this.tableResult;
    }
}
