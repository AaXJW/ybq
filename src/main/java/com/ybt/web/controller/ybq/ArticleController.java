package com.ybt.web.controller.ybq;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibm.icu.text.DateFormat;
import com.ibm.icu.text.SimpleDateFormat;
import com.jiufengxinxi.core.query.ListPropertyFilter;
import com.jiufengxinxi.core.query.PropertyFilter.MatchType;
import com.ybt.base.entity.Article;
import com.ybt.base.service.IArticleService;
import com.ybt.web.util.Constants;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value = "/Article/")
public class ArticleController {

	public static final String FIXEDPATH = "https://www.yibaiqian100.com/photo/static/img/";

	@Resource
	IArticleService articleService;

	@RequestMapping(value = "add")
	public ModelAndView add() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manager/Article/login");
		return mv;
	}

	@RequestMapping(value = "login")
	public String login(RedirectAttributes redirectAttributes, HttpServletRequest request) {

		String userName = request.getParameter("userName");

		String passWord = request.getParameter("passWord");
		if ("yibaiqian".equals(userName) && "yibaiqian750".equals(passWord)) {
			return Constants.REDIRECT + "addArticle.htm";
		} else {
			redirectAttributes.addFlashAttribute("message", "用户名或密码错误");
			return Constants.REDIRECT + "add.htm";
		}
	}

	@RequestMapping(value = "addArticle")
	public ModelAndView addArticle() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manager/Article/addArticle");
		return mv;
	}

	@RequestMapping(value = "save")
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("imagePath") MultipartFile myFile) {
		ModelAndView mv = new ModelAndView();

		String articleHeader = request.getParameter("articleHeader");

		String content = request.getParameter("content");
		
		String showTime = request.getParameter("showTime");

		String type = request.getParameter("type");

		String first = request.getParameter("first");

		String loopImage = request.getParameter("loopImage");

		try {
			// 输出文件后缀名称
			System.out.println(myFile.getOriginalFilename());
			// 图片名称
			String name = myFile.getOriginalFilename();
			if (name != null && !"".endsWith(name)) {
				String url = request.getSession().getServletContext().getRealPath("/static/img/");
				// 相对路径
				String path = "/" + name;
				File file = new File(url);
				if (!file.exists()) {
					file.mkdirs();
				}
				myFile.transferTo(new File(url + path));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String imagePath = FIXEDPATH + myFile.getOriginalFilename();

		Article article = new Article();

		article.setImagePath(imagePath);
		article.setContent(content);
		article.setFirst(Integer.parseInt(first));
		article.setType(type);
		article.setArticleHeader(articleHeader);
		article.setShowTime(showTime);
		article.setLoopImage(Integer.parseInt(loopImage));
		article.setAddDate(new Date());

		if (Integer.parseInt(first) == 1) {
			List<Article> list = articleService
					.findByFilters(ListPropertyFilter.getInstance().addFilter("type", type, MatchType.EQ));
			if (list != null && list.size() > 0) {

				for (Article article2 : list) {

					if (article2.getFirst() == 1) {

						Article arti = new Article();
						arti = article2;
						arti.setFirst(0);
						arti.setModifyTime(new Date());
						articleService.save(arti);
						break;
					}

				}

			}

		}

		articleService.save(article);

		mv.setViewName("manager/Article/addArticle");

		return mv;
	}

	@RequestMapping(value = "getArticle")
	public void getActicleByType(HttpServletRequest request, HttpServletResponse response) {

		response.setContentType("text/plain;charset=UTF-8"); // 当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		/*
		 * response.setContentType("text/plain");
		 * response.setCharacterEncoding("GB2312");
		 */

		String type = request.getParameter("type");

		String result = "";

		List<Article> list = null;

		try {
			PrintWriter out = null;
			if (type == null || "".equals(type)) {

				result = "当前数据异常";

				out.print(result);
				out.flush();
				System.out.println("发送报文：" + result);
			} else {

				switch (type) {
				case "all":
					list = articleService.findAll();
					break;
				case "loop":
					list = articleService
							.findByFilters(ListPropertyFilter.getInstance().addFilter("loopImage", 1, MatchType.EQ));
					break;
				case "yx":
				case "zzzs":
				case "zytb":
				case "zhpj":
				case "xgk":
				case "ms":
				case "js":

					Map<String, Object> param = new HashMap<String, Object>();
					param.put("type", type);
					param.put("first", 1);
					Article article = articleService.findUniqueByProperty(param);

					ListPropertyFilter filter = ListPropertyFilter.getInstance();// payTimeOutValue
					filter.addFilter("type", type, MatchType.EQ);
					filter.setOrderBy("addDate");
					filter.setOrder("desc");
					// 判断是否有置顶
					if (article != null) {
						list = articleService.findByFilters(filter);
						// 判断是否还有集合
						if (list != null) {

							LinkedHashSet<Article> set = new LinkedHashSet<>();
							set.add(article);
							for (Article ar : list) {
								set.add(ar);
							}
							List<Article> larticle = new ArrayList<>(set);
							list = larticle;
						} else {
							list.add(article);
						}

					} else {
						list = articleService.findByFilters(filter);
					}
					break;
				case "first":
					list = articleService
							.findByFilters(ListPropertyFilter.getInstance().addFilter("first", 1, MatchType.EQ));
										
					break;
				default:
					break;
				}

				if (list != null && list.size() > 0) {
					JSONArray listObject = JSONArray.fromObject(list);

					out = new PrintWriter(response.getOutputStream());
					out.print(listObject);
					out.flush();
					//System.out.println("发送报文：" + listObject);

				} else {

				}

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "test")
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manager/Article/demo");
		return mv;
	}

	/**
	 * 图片上传测试
	 * 
	 * @param request
	 * @param response
	 * @param myFile
	 * @return
	 */
	@RequestMapping("testFile")
	public Map<String, Object> updatePhoto(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("imagePath") MultipartFile myFile) {
		Map<String, Object> json = new HashMap<String, Object>();
		try {
			// 输出文件后缀名称
			System.out.println(myFile.getOriginalFilename());
			// 图片名称
			String name = myFile.getOriginalFilename();

			String url = request.getSession().getServletContext().getRealPath("/static/img/");
			// 相对路径
			String path = "/" + name;
			File file = new File(url);
			if (!file.exists()) {
				file.mkdirs();
			}
			myFile.transferTo(new File(url + path));
			json.put("success", "/static/img/upload/phono/" + path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;

	}

}
