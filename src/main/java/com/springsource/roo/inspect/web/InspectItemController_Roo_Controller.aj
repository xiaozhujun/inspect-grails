// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.inspect.web;

import com.springsource.roo.inspect.domain.InspectItem;
import com.springsource.roo.inspect.domain.InspectTable;
import com.springsource.roo.inspect.domain.InspectTag;
import com.springsource.roo.inspect.web.InspectItemController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect InspectItemController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InspectItemController.create(@Valid InspectItem inspectItem, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inspectItem);
            return "inspectitems/create";
        }
        uiModel.asMap().clear();
        inspectItem.persist();
        return "redirect:/inspectitems/" + encodeUrlPathSegment(inspectItem.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InspectItemController.createForm(Model uiModel) {
        populateEditForm(uiModel, new InspectItem());
        return "inspectitems/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InspectItemController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inspectitem", InspectItem.findInspectItem(id));
        uiModel.addAttribute("itemId", id);
        return "inspectitems/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InspectItemController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("inspectitems", InspectItem.findInspectItemEntries(firstResult, sizeNo));
            float nrOfPages = (float) InspectItem.countInspectItems() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("inspectitems", InspectItem.findAllInspectItems());
        }
        addDateTimeFormatPatterns(uiModel);
        return "inspectitems/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InspectItemController.update(@Valid InspectItem inspectItem, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inspectItem);
            return "inspectitems/update";
        }
        uiModel.asMap().clear();
        inspectItem.merge();
        return "redirect:/inspectitems/" + encodeUrlPathSegment(inspectItem.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InspectItemController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, InspectItem.findInspectItem(id));
        return "inspectitems/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InspectItemController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        InspectItem inspectItem = InspectItem.findInspectItem(id);
        inspectItem.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/inspectitems";
    }
    
    void InspectItemController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("inspectItem_createtime_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void InspectItemController.populateEditForm(Model uiModel, InspectItem inspectItem) {
        uiModel.addAttribute("inspectItem", inspectItem);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inspecttables", InspectTable.findAllInspectTables());
        uiModel.addAttribute("inspecttags", InspectTag.findAllInspectTags());
    }
    
    String InspectItemController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
