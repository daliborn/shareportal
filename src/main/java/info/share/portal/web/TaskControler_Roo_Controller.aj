// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.web;

import info.share.portal.domain.Offer;
import info.share.portal.domain.Task;
import info.share.portal.domain.enums.Category;
import info.share.portal.domain.enums.Status;
import info.share.portal.domain.security.ShareUser;
import info.share.portal.web.TaskControler;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
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

privileged aspect TaskControler_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TaskControler.create(@Valid Task task, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, task);
            return "tasks/create";
        }
        uiModel.asMap().clear();
        task.persist();
        return "redirect:/tasks/" + encodeUrlPathSegment(task.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TaskControler.createForm(Model uiModel) {
        populateEditForm(uiModel, new Task());
        return "tasks/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TaskControler.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("task", Task.findTask(id));
        uiModel.addAttribute("itemId", id);
        return "tasks/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TaskControler.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("tasks", Task.findTaskEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Task.countTasks() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("tasks", Task.findAllTasks(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "tasks/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TaskControler.update(@Valid Task task, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, task);
            return "tasks/update";
        }
        uiModel.asMap().clear();
        task.merge();
        return "redirect:/tasks/" + encodeUrlPathSegment(task.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TaskControler.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Task.findTask(id));
        return "tasks/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TaskControler.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Task task = Task.findTask(id);
        task.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/tasks";
    }
    
    void TaskControler.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("task_creationdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("task_updatedate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("task_taskstartdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("task_taskenddate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void TaskControler.populateEditForm(Model uiModel, Task task) {
        uiModel.addAttribute("task", task);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("offers", Offer.findAllOffers());
        uiModel.addAttribute("categorys", Arrays.asList(Category.values()));
        uiModel.addAttribute("statuses", Arrays.asList(Status.values()));
        uiModel.addAttribute("shareusers", ShareUser.findAllShareUsers());
    }
    
    String TaskControler.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
