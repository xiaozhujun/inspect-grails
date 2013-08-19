package com.springsource.roo.inspect.web;
import com.springsource.roo.inspect.domain.InspectTag;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/inspecttags")
@Controller
@RooWebScaffold(path = "inspecttags", formBackingObject = InspectTag.class)
public class InspectTagController {
}
