package com.ybt.web.resolver;

import org.sitemesh.SiteMeshContext;
import org.sitemesh.content.ContentProperty;
import org.sitemesh.content.tagrules.TagRuleBundle;
import org.sitemesh.content.tagrules.html.ExportTagToContentRule;
import org.sitemesh.tagprocessor.State;

public class CustomTagRuleBundle implements TagRuleBundle {  
	  
    @Override  
    public void install(State defaultState, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {  
        defaultState.addRule("thistitle", new ExportTagToContentRule(siteMeshContext, contentProperty.getChild("thistitle"), false));
        defaultState.addRule("backurl", new ExportTagToContentRule(siteMeshContext, contentProperty.getChild("backurl"), false));
    }
  
    @Override  
    public void cleanUp(State defaultState, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {  
  
    }
}  