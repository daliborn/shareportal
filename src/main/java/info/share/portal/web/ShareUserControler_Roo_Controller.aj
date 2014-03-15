// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.web;

import info.share.portal.domain.Offer;
import info.share.portal.domain.security.ShareUser;
import info.share.portal.web.ShareUserControler;
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

privileged aspect ShareUserControler_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ShareUserControler.create(@Valid ShareUser shareUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shareUser);
            return "shareusers/create";
        }
        uiModel.asMap().clear();
        shareUser.persist();
        return "redirect:/shareusers/" + encodeUrlPathSegment(shareUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ShareUserControler.createForm(Model uiModel) {
        populateEditForm(uiModel, new ShareUser());
        return "shareusers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShareUserControler.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("shareuser", ShareUser.findShareUser(id));
        uiModel.addAttribute("itemId", id);
        return "shareusers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ShareUserControler.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shareusers", ShareUser.findShareUserEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ShareUser.countShareUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shareusers", ShareUser.findAllShareUsers(sortFieldName, sortOrder));
        }
        return "shareusers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ShareUserControler.update(@Valid ShareUser shareUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shareUser);
            return "shareusers/update";
        }
        uiModel.asMap().clear();
        shareUser.merge();
        return "redirect:/shareusers/" + encodeUrlPathSegment(shareUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ShareUserControler.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ShareUser.findShareUser(id));
        return "shareusers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ShareUserControler.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ShareUser shareUser = ShareUser.findShareUser(id);
        shareUser.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/shareusers";
    }
    
    void ShareUserControler.populateEditForm(Model uiModel, ShareUser shareUser) {
        uiModel.addAttribute("shareUser", shareUser);
        uiModel.addAttribute("offers", Offer.findAllOffers());
    }
    
    String ShareUserControler.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
