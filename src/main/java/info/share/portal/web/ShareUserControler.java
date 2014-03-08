package info.share.portal.web;
import info.share.portal.domain.ShareUser;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/shareusers")
@Controller
@RooWebScaffold(path = "shareusers", formBackingObject = ShareUser.class)
public class ShareUserControler {
}
