package epam.project.app.logic.controller;

import epam.project.app.logic.entity.dto.UserDTO;
import epam.project.app.logic.entity.user.User;
import epam.project.app.logic.entity.user.UserRole;
import epam.project.app.logic.service.UserService;
import epam.project.app.infra.web.ModelAndView;
import epam.project.app.infra.web.QueryParameterResolver;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final QueryParameterResolver parameterResolver;

    public ModelAndView login(HttpServletRequest req) {
        UserDTO userDTO = parameterResolver.getObject(req, UserDTO.class);
        User userByLogin = userService.getUserByLogin(userDTO);

        ModelAndView modelAndView = new ModelAndView();
        if (userByLogin.getUserRole().toString().equals(UserRole.INSPECTOR.toString())) {
            modelAndView.setView("/inspector/homePage.jsp");
        } else {
            modelAndView.setView("/client/homePage.jsp");
        }
        modelAndView.setRedirect(true);
        HttpSession session = req.getSession(true);
        session.setAttribute("user", userByLogin);
        return modelAndView;
    }

    public ModelAndView logout(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setView("/index.jsp");
        modelAndView.setRedirect(true);
        return modelAndView;
    }
}