package com.vk.DAO;

@SuppressWarnings("serial")
public class CustomException extends Exception {

	public CustomException() {
		super();
	}
	
	public CustomException(String msg)
	{
		super(msg);
	}

}
