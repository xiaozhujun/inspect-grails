package com.springsource.roo.inspect.web;
import com.springsource.roo.inspect.domain.InspectTable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/inspecttables")
@Controller
@RooWebScaffold(path = "inspecttables", formBackingObject = InspectTable.class)
public class InspectTableController {
}
