package boot.mvc.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.*"})
public class BootJspTestEx3Application {

	public static void main(String[] args) {
		SpringApplication.run(BootJspTestEx3Application.class, args);
	}

}
