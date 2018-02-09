package guru.springframework.blog;

import static org.junit.Assert.*;

import guru.springframework.blog.domain.User;
import guru.springframework.blog.repositories.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = BlogPostsApplication.class)

public class BlogPostsApplicationTests {

	@Autowired
	UserRepository repo;

	@Test
	public void crud() {
		String userName="user";
		repo.save(new User(userName, 18));
		User user = findByName(userName);
		user = update(user);
		delete(user);
		repo.save(new User("randomUser"+ UUID.randomUUID(), 18));
	}

	private void delete(User user) {
		repo.delete(user);
		user=repo.findOne(user.getId());
		assertNull(user);
	}

	private User findByName(String userName) {
		User user=repo.findByName(userName);
		assertNotNull("User should not be null",user);
		return user;
	}

	private User update(User user) {
		user.setAge(20);
		repo.save(user);
		user=repo.findOne(user.getId());
		assertEquals("Age updated should be 20",user.getAge(),20);
		return user;
	}


}
