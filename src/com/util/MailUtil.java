package com.util;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import java.util.Iterator;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.persistent.*;

public class MailUtil
{
	public MimeMessage  mimeMsg; //the information needs to be send out
	private Session session;
	private Properties props;
	private boolean needAuth = false;
	private String pageURL=null;
	private String username="";
	private String password="";
	private Multipart mp; //variable for store the title and the attachment of the mail
	
	public MailUtil()
	{
		setSmtpHost("bbmagi5.bbmag.bbraun.com");
		createMimeMessage();
		setFrom("eJD");
	}
	public MailUtil(String pageURL)
	{
		setSmtpHost("bbmagi5.bbmag.bbraun.com");
		createMimeMessage();
		setFrom("eJD");
	//	this.pageURL=pageURL;
		if(pageURL!=null){
			this.pageURL=pageURL;
		}
	}
	/*
	 * 
	 * @param hostName
	 */
	public void setSmtpHost(String hostName)
	{
	//	System.out.println("mail.smtp.host="+hostName);
		if(props==null)
		{
			props = System.getProperties();
		}
		props.put("mail.smtp.host", hostName);
	}
	
	public boolean createMimeMessage()
	{
		try{
			System.out.println("Session begin-------------");
			session = Session.getInstance(props,null);
		}catch(Exception e){
			System.out.println("Session.getInstance failed"+e);
			return false;
		}
//		System.out.println("MimeMessage begin---------------");
		try{
			mimeMsg=new MimeMessage(session);
			mp=new MimeMultipart();
			return true;
		}catch(Exception e){
			System.out.println("MimeMessage failed!"+e.toString());
			return false;
		}
	}
	/*
	 * 
	 * @param need
	 */
	public void setNeedAuth(boolean need)
	{
	//	System.out.println(":mail.smtp.auth="+need);
		if(props==null){
			props = System.getProperties();
		}
		if(need){
			props.put("mail.smtp.auth", "true");			
		}
		else{
			props.put("mail.smtp.auth", "false");
		}						
	}
	/*
	 * 
	 * @param name
	 * @param pass
	 * 
	 */
	public void setNamePass(String name, String pass)
	{
		username = name;
		password = pass;
	}
	/*
	 * 
	 * @param mailSubject
	 * @return boolean
	 */
	public boolean setSubject(String mailSubject)
	{
	//	System.out.println("set title begin-----------");
		try{
			if(!mailSubject.equals("")&&mailSubject!=null){
				mimeMsg.setSubject(mailSubject);
			}
			return true;	
		}catch(Exception e){
			System.out.println("set title failed");
			return false;
		}
	}
	/*
	 * add attachment
	 * @param filename
	 * @param return 
	 */
	public boolean addFileAffix(String filename)
	{
	//	System.out.println("Add New Attachment....");
		if(filename.equals("")||filename==null){
			return false;
		}
		String file[];
		file = filename.split(";");
		System.out.println("You have "+file.length+"attachments");
		try{
			for(int i=0;i<file.length;i++){
				BodyPart bp = new MimeBodyPart();
				FileDataSource fileds= new FileDataSource(file[i]);
				bp.setDataHandler(new DataHandler(fileds));
				bp.setFileName(fileds.getName());
				mp.addBodyPart(bp);
			}
			return true;
		}catch(Exception e){
			System.err.println("Add New Attachment: "+filename+"--failed!" +e);
			return false;
		}			
	}
	/*
	 * 
	 * @param form
	 * @return 
	 */
	public boolean setFrom(String from){
	//	System.out.println("Set From ....");
		try{
			mimeMsg.setFrom(new InternetAddress(from));
			return true;
		}catch(Exception e){
			return false;
		}
		
	}
	/*
	 * 
	 * @param to 
	 * @return 
	 */
	public boolean setTo(String to)
	{
		
	//	System.out.println("Set to.....");
        if(to==null||to.equals("")){
            return false;
        }
        try{
        	 mimeMsg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
        	return true;
        }catch(Exception e){
        	return false;
        }
	}
	
	public boolean setCopyTo(String copyto)
	{
		 if(copyto.equals("")||copyto==null){
	            return false;
	        }
	        try{
	            String copy[];
	            copy=copyto.split(";");
	            for(int i=0;i<copy.length;i++){
	                mimeMsg.setRecipients(Message.RecipientType.TO,(Address[])InternetAddress.parse(copy[i]));
	            }
	            return true;
	        }catch(Exception e){
	            return false;
	        }
	}
	/*
	 * Set Mail content
	 * @param mailBody
	 * @return boolean
	 */
    public boolean setBody(String mailBody){
        try{
            BodyPart bp=new MimeBodyPart();
            bp.setContent("<meta http-equiv=Context-Type context=text/html;charset=gb2312>"+mailBody,"text/html;charset=GB2312");
            mp.addBodyPart(bp);
            return true;
        }catch(Exception e){
            System.out.println("Set context Faild! "+e);
            return false;
        }
    }

    /*
     * @param htmlpath
     * return boolean
     */
    public boolean setHtml(String htmlpath){
        try{
            if(!htmlpath.equals("")||htmlpath!=null){
                BodyPart mbp=new MimeBodyPart();
                DataSource ds=new FileDataSource(htmlpath);
                mbp.setDataHandler(new DataHandler(ds));
                mbp.setHeader("Context-ID","meme");
                mp.addBodyPart(mbp);
                }
                return true;
            }catch(Exception  e){
                System.err.println("Set Html Faild!"+e);
                return false;
            }
        }
     public boolean setOut(){
    	 try{
             mimeMsg.setContent(mp);
             mimeMsg.saveChanges();
             System.out.println("Sending Mail......");
             Session mailSession=session.getInstance(props,null);
             Transport tp=mailSession.getTransport("smtp");
             tp.connect((String)props.getProperty("mail.stmp.host"),username,password);
             tp.sendMessage(mimeMsg,mimeMsg.getRecipients(Message.RecipientType.TO));
             //tp.sendMessage(mimeMsg,mimeMsg.getRecipients(Message.RecipientType.CC));
      //       System.out.println("Send Mail Success......");
             tp.close();
             return true;
         }catch(Exception e){
             e.printStackTrace();
             return false;
         }
     }
     public String contentStartPa(String content){
    	 String mc = content;
    	 
    	 
    	 return mc;
     }
     public void submitNewPosition(String jobTitle, String historyLog){
    	 StringBuffer mc = new StringBuffer();
    	 mc.append("<br>Dear  Sir/Mdm, <br><br>");
    	 mc.append("You have a request for new Job Description.<br><br>"+
			"Please click on the following link and follow this instruction [Login -> Inbox -> New Submission/Resubmission] for your further action/information.  <br><br>");
    	 mc.append("<br><textarea  rows='10' cols='70'>"+historyLog+"</textarea><br><br><br>");
    	 if(pageURL!=null){
    		 mc.append("Site URL : <a href='"+pageURL+"'>"+pageURL+"</a><br><br><br>");
    	 }
    	 
    	 mc.append("Your sincerely<br>");
		 mc.append("eJD administrator");
    	 mc.append("<br><br><br>===============Please Do Not Reply This Mail=============");
    	 this.setSubject("New Job Description: Notification");
    	 this.setBody(mc.toString());
     }
   
}
