package com.springsource.roo.inspect.web;
import com.springsource.roo.inspect.domain.Dept;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/depts")
@Controller
@RooWebScaffold(path = "depts", formBackingObject = Dept.class)
public class DeptController {
}
