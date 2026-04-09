package com.Grownited.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.Grownited.entity.UserEntity;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)   
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();

        ArrayList<String> publicUrl = new ArrayList<>();

        // Public pages
        publicUrl.add("/login"); 
        publicUrl.add("/signup");
        publicUrl.add("/register");
        publicUrl.add("/authenticate");
        publicUrl.add("/forgetpassword");
        publicUrl.add("/forgot-password");
        publicUrl.add("/reset-password");

    
        if (publicUrl.contains(uri) || uri.contains("assets") || uri.contains("css") 
                || uri.contains("js") || uri.contains("images")) {

            chain.doFilter(request, response);
        } 
        else {

            System.out.println("AuthFilter Running : " + new Date());
            System.out.println("Requested URI : " + uri);

            HttpSession session = req.getSession(false);

            if (session == null) {
                res.sendRedirect("/login");
                return;
            }

            UserEntity user = (UserEntity) session.getAttribute("user");

            if (user == null) {
                res.sendRedirect("/login");
            } 
            else {
                chain.doFilter(request, response);
            }
        }
    }
}