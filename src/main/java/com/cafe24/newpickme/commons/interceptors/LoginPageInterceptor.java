package com.cafe24.newpickme.commons.interceptors;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 로그인 페이지 interceptor
public class LoginPageInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 관리자, 회원 로그인 처리후 뒤로가기 했을 경우, 로그인페이지가 아닌 메인페이지로 리다이렉트
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") != null || session.getAttribute("adminId") != null) {
            response.sendRedirect(request.getContextPath()+"/main");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
