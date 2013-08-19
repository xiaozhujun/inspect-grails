package com.springsource.roo.inspect.web;
import com.springsource.roo.inspect.domain.InspectItem;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/inspectitems")
@Controller
@RooWebScaffold(path = "inspectitems", formBackingObject = InspectItem.class)
public class InspectItemController {
}
