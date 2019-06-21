package com.ybt.web.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.util.Assert;

import com.jiufengxinxi.core.query.ListPropertyFilter;
import com.jiufengxinxi.utils.Collections3;
import com.jiufengxinxi.utils.Reflections;

/**
 * jpa针对Web应用的Utils函数集合.
 * 
 * @author cjh
 */
public class JpaWebUtils {

	private JpaWebUtils() {
	}
	
	public static <T> Collection<T> buildList(Collection<T> srcIds){
		List<T> ids = new ArrayList<T>();
		if(null==srcIds)
			return ids;
		for(T id:srcIds){
			ids.add(id);
		}
		return  ids;
	}
	
	/**
	 * 
	 * @param <T>
	 * @param <ID>
	 * @param srcObjects
	 * @param checkedIds
	 * @param clazz
	 * @param propertyName
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static <T, ID> ID[] mergeByCheckedIdsToArray(final Collection<T> srcObjects, final Collection<ID> checkedIds,
			final Class<T> clazz,final String propertyName) throws Exception {
		mergeByCheckedIds(srcObjects,checkedIds,clazz);
/*		ID id=null;
		System.out.println("1111");
		System.out.println("222"+id.getClass());
		if(ReflectionUtils.isString(id.getClass()))
			return (ID[])ReflectionUtils.fetchElementPropertyToStringArray(srcObjects,propertyName);
		else */
			return (ID[])Collections3.extractToLongArray(srcObjects,propertyName);
		//String str = ReflectionUtils.fetchElementPropertyToString(srcObjects,"id",",");
		//System.out.println("str:"+str);
		//return str.split(",");
	}
	/**
	 * 
	 * @param <T>
	 * @param <ID>
	 * @param srcObjects
	 * @param checkedIds
	 * @param clazz
	 * @param propertyName
	 * @return
	 * @throws Exception
	 */
	public static <T, ID> String[] mergeByCheckedIdsToStringArray(final Collection<T> srcObjects, final Collection<ID> checkedIds,
			final Class<T> clazz,final String propertyName) throws Exception {
		mergeByCheckedIds(srcObjects,checkedIds,clazz);
		return Collections3.extractToStringArray(srcObjects,propertyName);
		//String str = ReflectionUtils.fetchElementPropertyToString(srcObjects,"id",",");
		//System.out.println("str:"+str);
		//return str.split(",");
	}
	
	public static <T, ID> Long[] mergeByCheckedIdsToLongArray(final Collection<T> srcObjects, final Collection<ID> checkedIds,
			final Class<T> clazz,final String propertyName) throws Exception {
		mergeByCheckedIds(srcObjects,checkedIds,clazz);
		return Collections3.extractToLongArray(srcObjects,propertyName);
		//String str = ReflectionUtils.fetchElementPropertyToString(srcObjects,"id",",");
		//System.out.println("str:"+str);
		//return str.split(",");
	}
	
	/**
	 * 根据对象ID集合,整理合并集合.
	 * 
	 * 默认对象主键的名称名为"id".
	 * @see #mergeByCheckedIds(Collection, Collection, Class, String) 
	 */
	public static <T, ID> void mergeByCheckedIds(final Collection<T> srcObjects, final Collection<ID> checkedIds,
			final Class<T> clazz) throws Exception {
		mergeByCheckedIds(srcObjects, checkedIds, clazz, "id");
	}

	/**
	 * 根据对象ID集合,整理合并集合.
	 * 
	 * 页面发送变更后的子对象id列表时,删除原来的子对象集合再根据页面id列表创建一个全新的集合这种看似最简单的做法是不行的.
	 * 因此需采用如此的整合算法：在源集合中删除id不在ID集合中的对象,根据ID集合中的id创建对象并添加到源集合中.
	 * 
	 * @param srcObjects 源对象集合
	 * @param checkedIds  目标ID集合
	 * @param clazz  集合中对象的类型
	 * @param idName 对象主键的名称
	 */
	public static <T, ID> void mergeByCheckedIds(final Collection<T> srcObjects, final Collection<ID> checkedIds,
			final Class<T> clazz, final String idName) throws Exception {

		//参数校验
		Assert.notNull(srcObjects, "scrObjects不能为空");
		Assert.hasText(idName, "idName不能为空");
		Assert.notNull(clazz, "clazz不能为空");

		//目标ID集合为空,删除源集合中所有对象后直接返回.
		if (checkedIds == null) {
			srcObjects.clear();
			return;
		}

		//遍历源集合,如果其id不在目标ID集合中的对象,进行删除.
		//同时,在目标ID集合中删除已在源集合中的id,使得目标ID集合中剩下的id均为源集合中没有的ID.
		Iterator<T> srcIterator = srcObjects.iterator();
		try {

			while (srcIterator.hasNext()) {
				T element = srcIterator.next();
				Object id;
				id = PropertyUtils.getProperty(element, idName);

				if (!checkedIds.contains(id)) {
					srcIterator.remove();
				} else {
					checkedIds.remove(id);
				}
			}

			//ID集合目前剩余的id均不在源集合中,创建对象,为id属性赋值并添加到源集合中.
			for (ID id : checkedIds) {
				T obj = clazz.newInstance();
				PropertyUtils.setProperty(obj, idName, id);
				srcObjects.add(obj);
			}
		} catch (Exception e) {
			throw Reflections.convertReflectionExceptionToUnchecked(e);
		}
	}

	/**
	 * 根据按PropertyFilter命名规则的Request参数,创建PropertyFilter列表.
	 * 默认Filter属性名前缀为filter_.
	 * 
	 * @see #buildPropertyFilters(HttpServletRequest, String)
	 */
	public static ListPropertyFilter buildPropertyFilters(final HttpServletRequest request) {
		return buildPropertyFilters(request, "filter_");
	}

/*	public static List<PropertyFilter> buildPropertyFilters(Class clazz, final HttpServletRequest request) {
		return buildPropertyFilters(clazz, request, "filter_");
	}*/
	
	/**
	 * 根据按PropertyFilter命名规则的Request参数,创建PropertyFilter列表.
	 * PropertyFilter命名规则为Filter属性前缀_比较类型_属性名.
	 * 
	 * eg.
	 * filter_EQUAL_name
	 * filter_LIKE_name_OR_email
	 */
	@SuppressWarnings("unchecked")
	public static ListPropertyFilter buildPropertyFilters(final HttpServletRequest request, final String filterPrefix) {
		ListPropertyFilter filterList = ListPropertyFilter.getInstance();
		//System.out.println("buildPropertyFilters（）");
		//从request中获取含属性前缀名的参数,构造去除前缀名后的参数Map.
		Map<String, String> filterParamMap = WebAppUtils.getParametersStartingWith(request, filterPrefix);

		//分析参数Map,构造PropertyFilter列表
		for (Map.Entry<String, String> entry : filterParamMap.entrySet()) {
			String filterName = entry.getKey().replaceAll("_GET_", ".");
			String value = entry.getValue();
			//System.out.println("filterName:"+filterName);
			//System.out.println("value:"+value);
			//如果value值为空,则忽略此filter.
			boolean omit = StringUtils.isBlank(value);
			if (!omit) {
				filterList.addFilter(filterName, value);
				//PropertyFilter filter = new PropertyFilter(filterName, value);
				//filterList.add(filter);
			}
		}
		
		return filterList;
	}
/*	
	public static List<PropertyFilter> buildPropertyFilters(Class clazz, final HttpServletRequest request, final String filterPrefix) {
		List<PropertyFilter> filterList = new ArrayList<PropertyFilter>();

		//从request中获取含属性前缀名的参数,构造去除前缀名后的参数Map.
		Map<String, String> filterParamMap = WebUtils.getParametersStartingWith(request, filterPrefix);

		//分析参数Map,构造PropertyFilter列表
		for (Map.Entry<String, String> entry : filterParamMap.entrySet()) {
			String filterName = entry.getKey();
			String value = entry.getValue();
			//如果value值为空,则忽略此filter.
			boolean omit = StringUtils.isBlank(value);
			if (!omit) {

				//分析filterName,获取matchType与propertyName
				MatchType matchType;
				String matchTypeCode = StringUtils.substringBefore(filterName, "_");
				try {
					matchType = Enum.valueOf(MatchType.class, matchTypeCode);
				} catch (RuntimeException e) {
					throw new IllegalArgumentException("filter名称没有按规则编写,无法得到属性比较类型.", e);
				}
				String propertyName = StringUtils.substringAfter(filterName, "_");
				PropertyFilter filter;
				if(propertyName.indexOf(PropertyFilter.OR_SEPARATOR)>-1){
					filter = new PropertyFilter(propertyName, value, matchType);
				}
				else if(propertyName.indexOf(".")>-1){
					Field filed0  = EntityHelper.getField(clazz,StringUtils.substringBefore(propertyName, "."));
					Field filed = EntityHelper.getField(filed0.getType(),StringUtils.substringAfter(propertyName, "."));
					filter = new PropertyFilter(propertyName, DataConverter.convertData(value, filed.getType()), matchType);
				}else{
					Field filed  = EntityHelper.getField(clazz,propertyName);
					filter = new PropertyFilter(propertyName, DataConverter.convertData(value, filed.getType()), matchType);
				}
				
				filterList.add(filter);
			}
		}
		return filterList;
	}*/
}
