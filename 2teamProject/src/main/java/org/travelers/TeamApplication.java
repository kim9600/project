package org.travelers;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.autoconfigure.security.SpringBootWebSecurityConfiguration;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
//@EnableAutoConfiguration(exclude = {org.springframework.boot.autoconfigure.security.SecurityFilterAutoConfiguration.class, SpringBootWebSecurityConfiguration.class})
/*@EnableAutoConfiguration(exclude = { DataSourceTransactionManagerAutoConfiguration.class, DataSourceAutoConfiguration.class })*/

/*@ImportResource(value = {"classpath:root-context.xml",
        "classpath:servlet-context.xml"})*/



public class TeamApplication {
    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(TeamApplication.class);
        application.run(args);
    }
}

