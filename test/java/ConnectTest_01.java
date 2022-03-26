import java.sql.Connection;
import java.sql.DriverManager;

/* 오라클 접속 테스트 */
public class ConnectTest_01 {
	public static void main(String[] args) {
       String url ="jdbc:oracle:thin:@db01_high?TNS_ADMIN=/Users/Dan/Desktop/Develop/workspace/Wallet_DB01";
       String userid="admin";
       String pwd ="Dandatabase01";
       
     
       //드라이버 로딩 
       try {
    	    //oracle DB연결 드라이버 로딩
    	    Class.forName("oracle.jdbc.OracleDriver");//
    	    System.out.println("드라이버 로딩 성공");
       }catch(Exception e) {
    	    e.printStackTrace();
       }
       
       //DBMS와 연결
       try {
    	       System.out.println("데이터베이스 연결 준비......");
    	       Connection con =DriverManager.getConnection(url, userid, pwd);
    	       if(con!=null) {
    	    	   System.out.println("데이터베이스 연결 성공...");
    	       }
       }catch(Exception e) {
    	   e.printStackTrace();
       }
	}
}