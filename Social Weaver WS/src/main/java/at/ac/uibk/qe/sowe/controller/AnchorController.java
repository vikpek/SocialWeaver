package at.ac.uibk.qe.sowe.controller;

import at.ac.uibk.qe.sowe.Anchor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/anchors")
@Controller
@RooWebScaffold(path = "anchors", formBackingObject = Anchor.class)
@RooWebJson(jsonObject = Anchor.class)
public class AnchorController {

    @RequestMapping(value="/updates/{lastModifiedTimestamp}")
    public ResponseEntity<String> listNewAnchorsJson(@PathVariable Long lastModifiedTimestamp) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Anchor> result = Anchor.findAllAnchorsWithNewerTimestamp(lastModifiedTimestamp);
        return new ResponseEntity<String>(Anchor.toJsonArray(result), headers, HttpStatus.OK);
    }

    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Anchor> result = Anchor.findAllAnchors();
        for(Anchor a : result){
            a.setPayload(new String(a.getBinaryPayload()));
        }
        String t = Anchor.toJsonArray(result);
        return new ResponseEntity<String>(t, headers, HttpStatus.OK);
    }
}
