package config;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

//필터 : 요청에 앞서 처리되는 코드 정의
//url pattern : /*(모든 요청 다 처리)
@WebFilter("/*")
public class EncodingFilter extends HttpFilter implements Filter {
    private String charset="utf-8";

    //필터를 제거해주는 역할(서버가 멈출 때 작동)
	public void destroy() {
		System.out.println("필터가 제거되었습니다.");
	}

	//요청이 들어올 때 거쳐가는 코드
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		System.out.println("필터가 실행되었습니다.");
		request.setCharacterEncoding(charset);
		chain.doFilter(request, response); //실제로 여기서 필터가 처리됨.
	}

	//필터 초기화 코드(서버가 시작될 때 실행)
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("필터가 초기화 되었습니다.");
	}

}
