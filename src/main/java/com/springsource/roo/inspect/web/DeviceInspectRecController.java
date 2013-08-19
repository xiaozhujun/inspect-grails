package com.springsource.roo.inspect.web;
import com.springsource.roo.inspect.domain.DeviceInspectRec;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/deviceinspectrecs")
@Controller
@RooWebScaffold(path = "deviceinspectrecs", formBackingObject = DeviceInspectRec.class)
public class DeviceInspectRecController {
}
