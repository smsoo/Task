/**
 * LoginProperties.java
 * Version 1.0
 * 29 Aug 2006
 * This class is mainly used to handle the logon.properties file. The coding
 *   below was downloaded online and then modified.
 */
 
package com.util;

import java.io.*;
import java.util.*;

import org.apache.struts2.ServletActionContext;

public class LoginProperties extends java.util.Properties 
{
	ArrayList keys = new ArrayList();
	
	public LoginProperties() 
	{
		super();
	}

	public LoginProperties(java.util.Properties defaults) 
	{
		super(defaults);
	}
	
	public synchronized Iterator getKeysIterator() 
	{
		return keys.iterator();
	}
	
	public static LoginProperties load(String name) throws IOException 
	{
		LoginProperties props = null;
		String realPath =ServletActionContext.getServletContext().getRealPath("/properties/");
		realPath=realPath.replace("\\","\\\\");
		props.load(new FileInputStream(realPath+"\\\\path.properties"));

			//System.out.println("jco.client.client - "+props.getProperty("jco.client.client"));
			return props;
	}
	
	public synchronized Object put(Object key, Object value) 
	{
		Object obj = super.put(key, value);
		keys.add(key);
		return obj;
	}
}