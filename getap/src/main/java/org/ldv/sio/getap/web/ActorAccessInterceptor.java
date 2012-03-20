/**
 * Implémentation de la logique d'accès aux contrôleurs de cas d'utilisation
 *  
 * @author kpu
 */
package org.ldv.sio.getap.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ldv.sio.getap.app.User;
import org.ldv.sio.getap.utils.UtilSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ActorAccessInterceptor extends HandlerInterceptorAdapter {
	// private final Log logger = LogFactory.getLog(getClass());
	private final Logger logger = LoggerFactory
			.getLogger(ActorAccessInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		String controllerName = request.getRequestURI().split("/")[3];

		System.out.println("TEST  INTERCEPTOR 2:" + request.getContextPath()
				+ " servlet: " + controllerName);

		logger.info("TEST  INTERCEPTOR with LOGGER !:"
				+ request.getContextPath() + " servlet: " + controllerName);

		User userInSession = UtilSession.getUserInSession();
		String role = (userInSession != null) ? userInSession.getRole() : "";

		boolean ok = true;

		if (!controllerName.equals("login") && null == userInSession) {
			response.sendRedirect(request.getContextPath() + "/app/login/index");
			ok = false;
		}

		// Redirige l'user vers son répertoire si page != de son role pour le
		// cas eleve ou prof-intervenant
		else if (!controllerName.equals(role)
				&& !controllerName.equals("login") && !role.equals("admin")
				&& !role.equals("prof-principal")) {
			response.sendRedirect(request.getContextPath() + "/app/" + role
					+ "/index");
			ok = false;
		}

		// cas spécial admin
		else if (!controllerName.equals(role)
				&& !controllerName.equals("hotels")
				&& !controllerName.equals("login") && role.equals("admin")) {
			response.sendRedirect(request.getContextPath() + "/app/" + role
					+ "/index");
			ok = false;
		}

		// cas spécial prof-principal
		else if (!controllerName.equals(role)
				&& !controllerName.equals("prof-intervenant")
				&& !controllerName.equals("login")
				&& role.equals("prof-principal")) {
			response.sendRedirect(request.getContextPath() + "/app/" + role
					+ "/index");
			ok = false;
		}

		return ok;

	}
}
