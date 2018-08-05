package tk.guozilan.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import tk.guozilan.base.controller.AbstractController;
import tk.guozilan.base.model.ListResponse;
import tk.guozilan.base.model.ObjectResponse;
import tk.guozilan.sample.api.UserService;
import tk.guozilan.sample.model.User;

/**
 * @author guozilan
 */
@Controller
@RequestMapping("users")
public class UserController extends AbstractController {

    @Autowired
    private UserService userService;

    @RequestMapping("/page")
    public ModelAndView main() {
        return new ModelAndView("sample/users-main");
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.GET)
    public ListResponse<User> listByUser(User user) {
        try {
            return ListResponse.ok(userService.select(user));
        } catch (Exception e) {
            return ListResponse.error(e);
        }
    }

    @ResponseBody
    @RequestMapping("/{id}")
    public ObjectResponse<User> listUser(@PathVariable("id") Long id) {
        try {
            return ObjectResponse.ok(userService.selectById(id));
        } catch (Exception e) {
            return ObjectResponse.error(e);
        }
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST)
    public ObjectResponse<User> saveOrUpdate(User user) {
        try {
            return ObjectResponse.ok(userService.saveOrUpdate(user));
        } catch (Exception e) {
            return ObjectResponse.error(e);
        }
    }

    @ResponseBody
    @RequestMapping(value = "{id}", method = RequestMethod.DELETE)
    public ObjectResponse<Integer> delete(@PathVariable("id") Long id) {
        try {
            return ObjectResponse.ok(userService.deleteById(id));
        } catch (Exception e) {
            return ObjectResponse.error(e);
        }
    }

}
