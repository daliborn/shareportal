// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package info.share.portal.domain;

import info.share.portal.domain.Offer;
import info.share.portal.domain.OfferDataOnDemand;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect OfferDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OfferDataOnDemand: @Component;
    
    private Random OfferDataOnDemand.rnd = new SecureRandom();
    
    private List<Offer> OfferDataOnDemand.data;
    
    public Offer OfferDataOnDemand.getNewTransientOffer(int index) {
        Offer obj = new Offer();
        setDescription(obj, index);
        setPrice(obj, index);
        return obj;
    }
    
    public void OfferDataOnDemand.setDescription(Offer obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void OfferDataOnDemand.setPrice(Offer obj, int index) {
        BigDecimal price = BigDecimal.valueOf(index);
        obj.setPrice(price);
    }
    
    public Offer OfferDataOnDemand.getSpecificOffer(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Offer obj = data.get(index);
        Long id = obj.getId();
        return Offer.findOffer(id);
    }
    
    public Offer OfferDataOnDemand.getRandomOffer() {
        init();
        Offer obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Offer.findOffer(id);
    }
    
    public boolean OfferDataOnDemand.modifyOffer(Offer obj) {
        return false;
    }
    
    public void OfferDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Offer.findOfferEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Offer' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Offer>();
        for (int i = 0; i < 10; i++) {
            Offer obj = getNewTransientOffer(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}