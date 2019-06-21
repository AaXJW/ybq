package com.ybt.web.filter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

import com.ybt.web.resolver.CustomTagRuleBundle;

public class SiteMeshFilter extends ConfigurableSiteMeshFilter {  
    @Override  
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {  
        //customer decorator  
        builder.addTagRuleBundle(new CustomTagRuleBundle());  
    }  
}  