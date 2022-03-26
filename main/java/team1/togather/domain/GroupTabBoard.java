package team1.togather.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupTabBoard {
	private long gbnum;
	private String gbtitle;
	private long mnum;
	private String gbcontent;
	private String gbfile;
	private int gblike;
	private int gbview;
	private Date rdate;
	private long gseq;
}
