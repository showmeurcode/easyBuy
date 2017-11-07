/**
 * 
 */
package cn.easybuy.entity;

import java.io.Serializable;

/**
 * @author yinxiaochen
 * 新闻类实体类
 *
 */
public class News implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id; //新闻序号
	private String title;//新闻标题
	private String content;//新闻内容
	private String createTime;//创建时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	
}
