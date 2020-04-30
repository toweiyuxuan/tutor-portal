package cn.wyx.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class SourceGenerator {
	
	
	public static void main(String[] args) throws Exception {
		
		
		generator("Mechanismtype");
	}
	
	public static void generator(String className) throws Exception{
		generQuery(className);
		generDao(className);
		generDaoImpl(className);
		
		generService(className);
		generServiceImpl(className);
		
		generDaoConfig(className);
		generServiceConfig(className);
		
		generAction(className);
		generSpringActionConfig(className);
	}
	
	/**
	 * 生成查询对象
	 * @param ClassName
	 * @throws Exception
	 */
	public static void generQuery(String ClassName) throws Exception{
		BufferedReader br = new BufferedReader(new FileReader("config/cn/wyx/template/DemoQuery.tlf"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("src/cn/wyx/query/"+ClassName+"Query.java"));
		String line = null;
		String newLine = null;
		while((line = br.readLine()) != null){
			newLine = line.replace("Demo", ClassName);
			bw.write(newLine);
			bw.newLine();
			bw.flush();
		}
		bw.close();
		br.close();
		
	}
	
	/**
	 * 生成dao
	 * @param ClassName
	 * @throws Exception
	 */
	public static void generDao(String ClassName) throws Exception{
		BufferedReader br = new BufferedReader(new FileReader("config/cn/wyx/template/DemoDao.tlf"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("src/cn/wyx/dao/"+ClassName+"Dao.java"));
		String line = null;
		String newLine = null;
		while((line = br.readLine()) != null){
			newLine = line.replace("Demo", ClassName);
			bw.write(newLine);
			bw.newLine();
			bw.flush();
		}
		bw.close();
		br.close();
		
	}
	
	
	public static void generDaoImpl(String ClassName) throws Exception{
		BufferedReader br = new BufferedReader(new FileReader("config/cn/wyx/template/DemoDaoImpl.tlf"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("src/cn/wyx/dao/impl/"+ClassName+"DaoImpl.java"));
		String line = null;
		String newLine = null;
		while((line = br.readLine()) != null){
			newLine = line.replace("Demo", ClassName);
			bw.write(newLine);
			bw.newLine();
			bw.flush();
		}
		bw.close();
		br.close();
		
	}
	
	public static void generService(String ClassName) throws Exception{
		BufferedReader br = new BufferedReader(new FileReader("config/cn/wyx/template/DemoService.tlf"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("src/cn/wyx/service/"+ClassName+"Service.java"));
		String line = null;
		String newLine = null;
		while((line = br.readLine()) != null){
			newLine = line.replace("Demo", ClassName);
			bw.write(newLine);
			bw.newLine();
			bw.flush();
		}
		bw.close();
		br.close();
		
	}
	
	
	public static void generServiceImpl(String ClassName) throws Exception{
		//获得小写的类名
		String lowerCaseClassName = ClassName.substring(0, 1).toLowerCase() + ClassName.substring(1);
		BufferedReader br = new BufferedReader(new FileReader("config/cn/wyx/template/DemoServiceImpl.tlf"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("src/cn/wyx/service/impl/"+ClassName+"ServiceImpl.java"));
		String line = null;
		String newLine = null;
		while((line = br.readLine()) != null){
			newLine = line.replace("Demo", ClassName).replace("demo", lowerCaseClassName);
			bw.write(newLine);
			bw.newLine();
			bw.flush();
		}
		bw.close();
		br.close();
		
	}
	
	
	public static void generDaoConfig(String ClassName) throws Exception{
		//获得小写的类名
		String lowerCaseClassName = ClassName.substring(0, 1).toLowerCase() + ClassName.substring(1);
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new FileReader("config/ApplicationContext-dao.xml"));
		Element rootElement = doc.getRootElement();
		
		
		Element newEle = rootElement.addElement("bean")
					.addAttribute("id", lowerCaseClassName+"Dao")
					.addAttribute("class", "cn.wyx.dao.impl."+ClassName+"DaoImpl");
		newEle.addElement("property")
			  .addAttribute("name", "sessionFactory")
			  .addAttribute("ref", "sessionFactory");
		XMLWriter writer = new XMLWriter(new FileWriter("config/ApplicationContext-dao.xml"), OutputFormat.createPrettyPrint());
		writer.write(doc);
		writer.close();
	
	}
	
	public static void generServiceConfig(String ClassName) throws Exception{
		//获得小写的类名
		String lowerCaseClassName = ClassName.substring(0, 1).toLowerCase() + ClassName.substring(1);
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new FileReader("config/ApplicationContext-service.xml"));
		Element rootElement = doc.getRootElement();
		
		
		Element newEle = rootElement.addElement("bean")
					.addAttribute("id", lowerCaseClassName+"Service")
					.addAttribute("class", "cn.wyx.service.impl."+ClassName+"ServiceImpl");
		newEle.addElement("property")
			  .addAttribute("name", lowerCaseClassName+"Dao")
			  .addAttribute("ref", lowerCaseClassName+"Dao");
		XMLWriter writer = new XMLWriter(new FileWriter("config/ApplicationContext-service.xml"), OutputFormat.createPrettyPrint());
		writer.write(doc);
		writer.close();
	
	}
	
	
	public static void generAction(String ClassName) throws Exception{
		//获得小写的类名
		String lowerCaseClassName = ClassName.substring(0, 1).toLowerCase() + ClassName.substring(1);
		BufferedReader br = new BufferedReader(new FileReader("config/cn/wyx/template/DemoAction.tlf"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("src/cn/wyx/controller/"+ClassName+"Action.java"));
		String line = null;
		String newLine = null;
		while((line = br.readLine()) != null){
			newLine = line.replace("Demo", ClassName).replace("demo", lowerCaseClassName);
			bw.write(newLine);
			bw.newLine();
			bw.flush();
		}
		bw.close();
		br.close();
		
	}
	
	
	public static void generSpringActionConfig(String ClassName) throws Exception{
		//获得小写的类名
		String lowerCaseClassName = ClassName.substring(0, 1).toLowerCase() + ClassName.substring(1);
		SAXReader reader = new SAXReader();
		Document doc = reader.read(new FileReader("config/ApplicationContext-action.xml"));
		Element rootElement = doc.getRootElement();
		
		
		Element newEle = rootElement.addElement("bean")
					.addAttribute("id", lowerCaseClassName+"Action")
					.addAttribute("class", "cn.wyx.controller."+ClassName+"Action")
					.addAttribute("scope", "prototype");
		newEle.addElement("property")
			  .addAttribute("name", lowerCaseClassName+"Service")
			  .addAttribute("ref", lowerCaseClassName+"Service");
		XMLWriter writer = new XMLWriter(new FileWriter("config/ApplicationContext-action.xml"), OutputFormat.createPrettyPrint());
		writer.write(doc);
		writer.close();
	
	}

}
