package com.ybt.web.util;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.jiufengxinxi.utils.Tools;
/**
* 导入到EXCEL
* 类名称：ObjectExcelView.java
* @author FH Q313596790
* @version 1.0
 */
public class ObjectExcelView extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Date date = new Date();
		String filename = Tools.date2Str(date, "yyyyMMddHHmmss");
		HSSFSheet sheet;
		HSSFCell cell;
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+filename+".xls");
		sheet = workbook.createSheet("sheet1");
		
		
		HSSFCellStyle headerStyle = workbook.createCellStyle(); //标题样式
		headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		headerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		HSSFFont headerFont = workbook.createFont();	//标题字体
		headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		headerFont.setFontHeightInPoints((short)11);
		headerStyle.setFont(headerFont);
		short width = 20,height=25*20;
		
		int pix=1;
		
		List<String> titles = (List<String>) model.get("titles");
		int len = titles.size();
		sheet.setDefaultColumnWidth(width);
		
		Object headers= model.get("header");
		if(headers!=null){
			pix=2;
			cell = getCell(sheet, 0, 0);
			cell.setCellStyle(headerStyle);
			setText(cell,headers.toString());
			sheet.addMergedRegion(new Region(     
                    0, //first row (0-based)       
                   (short)0, //first column  (0-based)       
                    0, //last row (0-based)    
                   (short)(len-1)  //last column  (0-based)       
            ));
			sheet.getRow(0).setHeight(height);
		}
		
		
		for(int i=0; i<len; i++){ //设置标题
			String title = titles.get(i);
			cell = getCell(sheet, pix-1, i);
			cell.setCellStyle(headerStyle);
			setText(cell,title);
		}
		sheet.getRow(pix-1).setHeight(height);
		
		HSSFCellStyle contentStyle = workbook.createCellStyle(); //内容样式
		contentStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		contentStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		List<PageData> varList = (List<PageData>) model.get("varList");
		int varCount = varList.size();
		for(int i=0; i<varCount; i++){
			PageData vpd = varList.get(i);
			for(int j=0;j<len;j++){
				//String varstr = vpd.getString("var"+(j+1)) != null ? vpd.getString("var"+(j+1)) : "";
				Object data=vpd.get("var"+(j+1));
				cell = getCell(sheet, i+pix, j);
				cell.setCellStyle(contentStyle);
				//setText(cell,varstr);
				if(data instanceof Date){
					cell.setCellValue((Date)data);
				}else if(data instanceof Double){
					cell.setCellValue((Double)data);
				}else if(data instanceof Long){
					cell.setCellValue((Long)data);
				}else if(data instanceof Integer){
					cell.setCellValue((Integer)data); 
				}else {
					setText(cell, data==null?"":data.toString());
				}
			}
			sheet.getRow(i+pix).setHeight(height);
		}
		
	}

}
