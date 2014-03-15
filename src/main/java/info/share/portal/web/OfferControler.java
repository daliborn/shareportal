package info.share.portal.web;
import info.share.portal.domain.Offer;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/offers")
@Controller
@RooWebScaffold(path = "offers", formBackingObject = Offer.class)
public class OfferControler {
}
