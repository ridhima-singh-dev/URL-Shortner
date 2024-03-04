package service;

import org.apache.commons.validator.routines.UrlValidator;
import com.google.common.hash.Hashing;
import redis.clients.jedis.Jedis;

import java.nio.charset.StandardCharsets;
import javax.enterprise.context.RequestScoped;
import javax.validation.constraints.NotNull;

@RequestScoped
public class UrlShortenerService {

    private Jedis jedis = new Jedis("redis", 6379);
    public String createShortUrl(@NotNull String url) {
        //System.out.println("Here in createShort");
        UrlValidator urlValidator = new UrlValidator(new String[]{"http", "https"});
        if (urlValidator.isValid(url)) {
            // Generate a unique identifier for the URL
            String id = Hashing.murmur3_32().hashString(url, StandardCharsets.UTF_8).toString();

            String shortUrl = "http://short.url/" + id;
            //System.out.println(shortUrl + "ShortURL Put");
            jedis.set(shortUrl, url);

            return shortUrl;
        } else {
            throw new IllegalArgumentException("URL Invalid: " + url);
        }
    }

    public String getOriginalUrl(String shortUrl) {
        return jedis.get(shortUrl);
    }
}
