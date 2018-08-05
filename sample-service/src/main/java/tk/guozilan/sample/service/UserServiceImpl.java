package tk.guozilan.sample.service;

import org.springframework.stereotype.Service;
import tk.guozilan.base.service.AbstractService;
import tk.guozilan.sample.api.UserService;
import tk.guozilan.sample.mapper.UserMapper;
import tk.guozilan.sample.model.User;

/**
 * @author guozilan
 */
@Service
public class UserServiceImpl extends AbstractService<User, UserMapper> implements UserService {

}
