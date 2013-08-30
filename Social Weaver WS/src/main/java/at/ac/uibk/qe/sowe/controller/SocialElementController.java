package at.ac.uibk.qe.sowe.controller;

import at.ac.uibk.qe.sowe.SocialElement;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/socialelements")
@Controller
@RooWebScaffold(path = "socialelements", formBackingObject = SocialElement.class)
@RooWebJson(jsonObject = SocialElement.class)
public class SocialElementController {
}
