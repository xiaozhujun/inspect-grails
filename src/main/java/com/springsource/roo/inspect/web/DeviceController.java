package com.springsource.roo.inspect.web;
import com.springsource.roo.inspect.domain.Device;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/devices")
@Controller
@RooWebScaffold(path = "devices", formBackingObject = Device.class)
public class DeviceController {
}
