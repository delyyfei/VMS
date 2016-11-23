package net.sunniwell.vms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhoudeming
 * @date 2016/11/17
 */
@Controller
@RequestMapping("/view")
public class ViewController {

    @RequestMapping("/base")
    public String base() {
        return "base";
    }

    @RequestMapping("/operator")
    public String operator() {
        return "operator";
    }

    @RequestMapping("/scanfile")
    public String scanfile() {
        return "scanfile";
    }

    @RequestMapping("/transcoding")
    public String transcoding() {
        return "transcoding";
    }
}
