// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package at.ac.uibk.qe.sowe.controller;

import at.ac.uibk.qe.sowe.Anchor;
import at.ac.uibk.qe.sowe.SocialElement;
import at.ac.uibk.qe.sowe.controller.AnchorController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AnchorController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AnchorController.create(@Valid Anchor anchor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, anchor);
            return "anchors/create";
        }
        uiModel.asMap().clear();
        anchor.persist();
        return "redirect:/anchors/" + encodeUrlPathSegment(anchor.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AnchorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Anchor());
        return "anchors/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AnchorController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("anchor", Anchor.findAnchor(id));
        uiModel.addAttribute("itemId", id);
        return "anchors/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AnchorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("anchors", Anchor.findAnchorEntries(firstResult, sizeNo));
            float nrOfPages = (float) Anchor.countAnchors() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("anchors", Anchor.findAllAnchors());
        }
        return "anchors/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AnchorController.update(@Valid Anchor anchor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, anchor);
            return "anchors/update";
        }
        uiModel.asMap().clear();
        anchor.merge();
        return "redirect:/anchors/" + encodeUrlPathSegment(anchor.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AnchorController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Anchor.findAnchor(id));
        return "anchors/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AnchorController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Anchor anchor = Anchor.findAnchor(id);
        anchor.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/anchors";
    }
    
    void AnchorController.populateEditForm(Model uiModel, Anchor anchor) {
        uiModel.addAttribute("anchor", anchor);
        uiModel.addAttribute("socialelements", SocialElement.findAllSocialElements());
    }
    
    String AnchorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
